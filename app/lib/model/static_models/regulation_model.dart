import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

part 'regulation_model.freezed.dart';
/// Object that defines legality of pokemon, items, moves, etc. for a ruleset
@freezed
abstract class Regulation with _$Regulation {
  const factory Regulation({
    required String id,
    required String name,
    required List<String> clauseIds,
    required bool isDynamaxLegal,
    required bool isMegaLegal,
    required bool isTeraLegal,
  }) = _Regulation;

  factory Regulation.fromRowWithClauses(sqlite.Row row, List<String> clauseIds) {
    return Regulation(
      id: row['id'] as String,
      name: row['name'] as String,
      clauseIds: clauseIds,
      isDynamaxLegal: row['is_dynamax_legal'] == 1,
      isMegaLegal: row['is_mega_legal'] == 1,
      isTeraLegal: row['is_tera_legal'] == 1,
    );
  }
}