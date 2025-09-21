import 'package:app/utils/enums/learn_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

part 'move_pool_entry.freezed.dart';
part 'move_pool_entry.g.dart';

/// A move/pokemon pair that contains the learn method of the move for the pokemon
@freezed
abstract class MovePoolEntry with _$MovePoolEntry{
  const factory MovePoolEntry ({
    String? id,
    String? moveId,
    String? pokemonId,
    LearnMethod? learnMethod,
    int? levelupLevel,
  }) = _MovePoolEntry;

  factory MovePoolEntry.fromRow(sqlite.Row row) {
    LearnMethod learnMethod = LearnMethod.none;
    // FIXME: This logic assumes that only one of these fields is set to 1 (which is not strictly true, see Machamp Bulk Up), favoring levelup > tm > egg > tutor
    if (row['is_levelup_move'] == 1) {
      learnMethod = LearnMethod.levelup;
    } else if (row['is_tm_move'] == 1) {
      learnMethod = LearnMethod.tm;
    } else if (row['is_egg_move'] == 1) {
      learnMethod = LearnMethod.egg;
    } else if (row['is_tutor_move'] == 1) {
      learnMethod = LearnMethod.tutor;
    }
    return MovePoolEntry(id: row['id'], moveId: row['move_id'], pokemonId: row['pokemon_id'], learnMethod: learnMethod, levelupLevel: row['levelup_level']);
  }

  factory MovePoolEntry.fromJson(Map<String, dynamic> json) => _$MovePoolEntryFromJson(json);
}