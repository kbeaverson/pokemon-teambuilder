import 'dart:convert';

import 'package:app/utils/enums/nature.dart';
import 'package:app/utils/enums/pokemon_type.dart';
import 'package:app/utils/enums/stat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

part 'slot_model.freezed.dart';
/// A fully customizable model for a pokemon set
@freezed
abstract class Slot with _$Slot {
  const factory Slot({
    required String id,
    String? teamId,
    String? pokemonId,
    @Default([]) List<String> movePoolEntryIds,
    String? abilityPoolEntryId,
    String? itemId,
    @Default(Nature.docile) Nature nature,
    @Default({
      Stat.hp : 31,
      Stat.atk : 31,
      Stat.def : 31,
      Stat.spa : 31,
      Stat.spd : 31,
      Stat.spe : 31,
    }) Map<Stat, int> ivs,
    @Default({
      Stat.hp : 0,
      Stat.atk : 0,
      Stat.def : 0,
      Stat.spa : 0,
      Stat.spd : 0,
      Stat.spe : 0,
    }) Map<Stat, int> evs,
    PokemonType? teraType,
    @Default(false) bool isGigantamax,
    String? notes,
    @Default(true) bool isDirty,
    int? teamPosition, // Optional position for ordering within a team
  }) = _Slot;

  factory Slot.newSlot({
    String? pokemonId,
    String? teamId,
    List<String>? movePoolEntryIds,
    String? abilityPoolEntryId,
    String? itemId,
    Nature nature = Nature.docile,
    Map<Stat, int> ivs = const {
      Stat.hp : 31,
      Stat.atk : 31,
      Stat.def : 31,
      Stat.spa : 31,
      Stat.spd : 31,
      Stat.spe : 31,
    },
    Map<Stat, int> evs = const {
      Stat.hp : 0,
      Stat.atk : 0,
      Stat.def : 0,
      Stat.spa : 0,
      Stat.spd : 0,
      Stat.spe : 0,
    },
    PokemonType? teraType,
    bool isGigantamax = false,
    String? notes,
    bool isDirty = true,
    int? teamPosition,
  }) {
    return Slot(
      id: const Uuid().v4(),
      teamId: teamId,
      pokemonId: pokemonId,
      movePoolEntryIds: movePoolEntryIds ?? [],
      abilityPoolEntryId: abilityPoolEntryId,
      itemId: itemId,
      nature: nature,
      ivs: ivs,
      evs: evs,
      teraType: teraType,
      isGigantamax: isGigantamax,
      notes: notes,
      isDirty: isDirty,
      teamPosition: teamPosition,
    );
  }

  factory Slot.fromRow(sqlite.Row row) {
    return Slot(
      id: row['id'],
      teamId: row['team_id'],
      pokemonId: row['pokemon_id'],
      movePoolEntryIds: (row['move_ids'] != null)
        ? (jsonDecode(row['move_ids']) as List<dynamic>).map((e) => e as String).toList()
        : [],
      abilityPoolEntryId: row['ability_id'],
      itemId: row['item_id'],
      nature: (row['nature'] != null)
        ? Nature.values.firstWhere((e) => e.toString().split('.').last == row['nature'])
        : Nature.docile,
      ivs: (row['ivs'] != null)
        ? (jsonDecode(row['ivs']) as Map<String, dynamic>).map(
            (key, value) => MapEntry(Stat.values.firstWhere((e) => e.toString().split('.').last == key), value as int),
          )
        : const {
            Stat.hp: 31,
            Stat.atk: 31,
            Stat.def: 31,
            Stat.spa: 31,
            Stat.spd: 31,
            Stat.spe: 31,
          },
      evs: (row['evs'] != null)
        ? (jsonDecode(row['evs']) as Map<String, dynamic>).map(
            (key, value) => MapEntry(Stat.values.firstWhere((e) => e.toString().split('.').last == key), value as int),
          )
        : const {
            Stat.hp: 0,
            Stat.atk: 0,
            Stat.def: 0,
            Stat.spa: 0,
            Stat.spd: 0,
            Stat.spe: 0,
          },
      teraType: (row['tera_type'] != null) 
        ? PokemonType.values.firstWhere((e) => e.toString().split('.').last == row['tera_type'])
        : null,
      isGigantamax: row['is_gigantamax'] == 1,
      notes: row['notes'],
      isDirty: row['is_dirty'] == 1,
      teamPosition: row['team_position'], // Optional position for ordering within a team
    );
  }
}