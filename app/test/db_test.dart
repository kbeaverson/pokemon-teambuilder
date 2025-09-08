import 'dart:io';
import 'package:flutter_test/flutter_test.dart'; // Add this import
import 'package:powersync/powersync.dart';
import 'package:path/path.dart';

const schema = Schema([
    Table('customers', [Column.text('name'), Column.text('email')])
]);

late PowerSyncDatabase testDB;

Future<String> getTestDatabasePath() async {
    const dbFilename = 'powersync-test.db';
    final dir = Directory.current.absolute.path;
    return join(dir, dbFilename);
}

Future<void> openTestDatabase() async {
    testDB = PowerSyncDatabase(
      schema: schema,
      path: await getTestDatabasePath(),
      //logger: testLogger,
    );

    await testDB.initialize();
}

Future<void> cleanupTestDatabase() async {
    await testDB.close();
    final dbPath = await getTestDatabasePath();
    final file = File(dbPath);
    if (await file.exists()) {
        await file.delete();
    }
}

void main() {
    group('PowerSync Database Tests', () {
        setUp(() async {
            await openTestDatabase(); // Open database before each test
        });

        tearDown(() async {
            await cleanupTestDatabase(); // Clean up after each test
        });

        test('INSERT', () async {
            await testDB.execute(
                'INSERT INTO customers(name, email) VALUES(?, ?)', 
                ['John Doe', 'john@hotmail.com']
            );

            final results = await testDB.getAll('SELECT * FROM customers');

            expect(results.length, 1);
            // Fix the expectation - results likely contains maps
            expect(results[0]['name'], 'John Doe');
            expect(results[0]['email'], 'john@hotmail.com');
        });
    });
}