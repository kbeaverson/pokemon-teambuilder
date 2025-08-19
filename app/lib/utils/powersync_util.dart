import 'package:powersync/powersync.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../model/schema.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Postgres Response codes that we cannot recover from by retrying.
final List<RegExp> fatalResponseCodes = [
  // Class 22 — Data Exception
  // Examples include data type mismatch.
  RegExp(r'^22...$'),
  // Class 23 — Integrity Constraint Violation.
  // Examples include NOT NULL, FOREIGN KEY and UNIQUE violations.
  RegExp(r'^23...$'),
  // INSUFFICIENT PRIVILEGE - typically a row-level security violation
  RegExp(r'^42501$'),
];

late final PowerSyncDatabase db;

Future<String> getDatabasePath() async {
  final dir = await getApplicationSupportDirectory();
  return join(dir.path, 'powersync.db');
}

bool isLoggedIn() {return Supabase.instance.client.auth.currentSession?.accessToken != null;}

Future<void> openDatabase() async {
  db = PowerSyncDatabase(schema: schema, path: await getDatabasePath());
  await db.initialize();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(url: dotenv.env['SUPABASE_URL']!, anonKey: dotenv.env['SUPABASE_ANON_KEY']!);

  SupabaseConnector? currentConnector;

  if (isLoggedIn()) {
    currentConnector = SupabaseConnector(db);
    db.connect(connector: currentConnector);
  }

  // Handle auth state changes
  Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
    final AuthChangeEvent event = data.event;
    if (event == AuthChangeEvent.signedIn) {
      currentConnector = SupabaseConnector(db);
      db.connect(connector: currentConnector!);
    } else if (event == AuthChangeEvent.signedOut) {
      currentConnector = null;
      db.disconnect();
    } else if (event == AuthChangeEvent.tokenRefreshed) {
      currentConnector?.prefetchCredentials();
    }
  });

}

class SupabaseConnector extends PowerSyncBackendConnector {
  PowerSyncDatabase db;

  SupabaseConnector(this.db);

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) {
      return;
    }

    final rest = Supabase.instance.client.rest;

    try {
      for (var operation in transaction.crud) {
        final table = rest.from(operation.table);

        if (operation.op == UpdateType.put) {
          var data = Map<String, dynamic>.of(operation.opData!);
          data['id'] = operation.id;
          await table.upsert(data);
        } else if (operation.op == UpdateType.patch) {
          await table.update(operation.opData!).eq('id', operation.id);
        } else if (operation.op == UpdateType.delete) {
          await table.delete().eq('id', operation.id);
        }
      }

      await transaction.complete();
    } on PostgrestException catch (e) {
      if (e.code != null && fatalResponseCodes.any((re) => re.hasMatch(e.code!))) {
        // TODO: Implement error log table?
        await transaction.complete();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session == null) { // Not currently logged in
      return null;
    }

    final token = session.accessToken;

    return PowerSyncCredentials(endpoint: 'https://68a25d215c5991819a166209.powersync.journeyapps.com', token: token);
  }
}