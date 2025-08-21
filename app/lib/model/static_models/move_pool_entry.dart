import 'package:app/utils/enums/learn_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

part 'move_pool_entry.freezed.dart';
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
    LearnMethod learnMethod = LearnMethod.egg;
    if (row['is_tm_move'] == 1) {
      learnMethod = LearnMethod.tm;
    } else if (row['is_levelup_move'] == 1) {
      learnMethod = LearnMethod.levelup;
    }
    return MovePoolEntry(id: row['id'], moveId: row['move_id'], pokemonId: row['pokemon_id'], learnMethod: learnMethod, levelupLevel: row['levelup_level']);
  }
}