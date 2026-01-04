import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

part 'ability_pool_entry_model.freezed.dart';
part 'ability_pool_entry_model.g.dart';

/// An ability/pokemon pair that contains whether the ability is the pokemon's hidden ability
@freezed
abstract class AbilityPoolEntry with _$AbilityPoolEntry {
  const factory AbilityPoolEntry ({
    required String id,
    String? abilityId,
    String? pokemonId,
    required bool isHidden,
  }) = _AbilityPoolEntry;

  factory AbilityPoolEntry.fromRow(sqlite.Row row) {
    // SQLite rows may store boolean-like values as integers (0/1) or null.
    // Convert to a Dart `bool` and provide a sensible default.
    final bool isHidden = row['is_hidden_ability'] == 1 ? true : false;

    // Ensure id and string fields are treated as strings (some sqlite drivers return ints)
    final idVal = row['id']?.toString() ?? '';
    final abilityIdVal = row['ability_id']?.toString();
    final pokemonIdVal = row['pokemon_id']?.toString();

    return AbilityPoolEntry(id: idVal, abilityId: abilityIdVal, pokemonId: pokemonIdVal, isHidden: isHidden);
  }

  factory AbilityPoolEntry.fromJson(Map<String, Object?> json) => _$AbilityPoolEntryFromJson(json);
}