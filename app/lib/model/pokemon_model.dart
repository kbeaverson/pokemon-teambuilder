import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;
import '../utils/enums/pokemon_type.dart';
part 'pokemon_model.freezed.dart';

/// Pokemon model that provides immutable, canonical data about a pokemon species
@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon({
    required String id, 
    required String name, 
    required int dexNum, 
    required List<PokemonType> type, 
    required bool isPreEvolution, 
    required double weight, 
    required int genderRatio, 
    required bool isMythical, 
    required bool isLegendary, 
    required bool isMax, 
    required bool isMega, 
    String? mandatoryItemName, 
    required int baseHP, 
    required int baseAtk, 
    required int baseDef, 
    required int baseSpA, 
    required int baseSpD, 
    required int baseSpe,
  }) = _Pokemon;

  factory Pokemon.fromRow(sqlite.Row row) {
    return Pokemon(
      id: row['id'],
      name: row['name'],
      dexNum: row['dex_num'],
      type: (row['type'] != null)
          ? (row['type'] as String).split(',').map(PokemonType.fromString).toList()
          : [],
      isPreEvolution: row['is_pre_evolution'] == 1,
      weight: row['weight'],
      genderRatio: row['gender_ratio'],
      isMythical: row['is_mythical'] == 1,
      isLegendary: row['is_legendary'] == 1,
      isMax: row['is_max'] == 1,
      isMega: row['is_mega'] == 1,
      mandatoryItemName: row['mandatory_item_name'],
      baseHP: row['base_hp'],
      baseAtk: row['base_atk'],
      baseDef: row['base_def'],
      baseSpA: row['base_spa'],
      baseSpD: row['base_spd'],
      baseSpe: row['base_spe'],
    );
  }
}
