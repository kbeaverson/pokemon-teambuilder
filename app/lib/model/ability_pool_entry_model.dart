import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

part 'ability_pool_entry_model.freezed.dart';

/// An ability/pokemon pair that contains whether the ability is the pokemon's hidden ability
@freezed
abstract class AbilityPoolEntry with _$AbilityPoolEntry {
  const factory AbilityPoolEntry ({
    required String id,
    required String abilityId,
    required String pokemonId,
    required bool isHidden,
  }) = _AbilityPoolEntry;

  factory AbilityPoolEntry.fromRow(sqlite.Row row) {
    return AbilityPoolEntry(id: row['id'], abilityId: row['ability_id'], pokemonId: row['pokemon_id'], isHidden: row['is_hidden']);
  }
}