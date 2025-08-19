import 'dart:core';
import 'package:app/utils/enums/pokemon_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;
import '../utils/enums/move_category.dart';
import '../utils/enums/move_target.dart';
part 'move_model.freezed.dart';

/// Move model that provides immutable, canonical data about a pokemon move
@freezed
abstract class Move with _$Move {
  const factory Move({
    required String id,
    required String name,
    required int dexNum,
    required List<PokemonType> type,
    required MoveCategory category,
    required MoveTarget target,
    required int power,
    required int accuracy,
    required int priority,
    required int pp,
    required String shortDescription,
    required String longDescription,
    required bool hasSecondaryEffect,
    required bool isMultiHit,
    int? multiHitHigh,
    int? multiHitLow,
    required bool ignoresSubstitute,
    required bool ignoresProtect,
    required bool bounceable,
    required bool bite,
    required bool bullet,
    required bool contact,
    required bool dance,
    required bool heal,
    required bool powder,
    required bool pulse,
    required bool punch,
    required bool slice,
    required bool sound,
    required bool wind,
    required bool boostedBySheerForce,
    required bool ohko,
    required bool isZmove,
    required bool isMaxMove,
    required bool isLegal,
  }) = _Move;

  factory Move.fromRow(sqlite.Row row) {
    return Move(
      id: row['id'],
      name: row['name'],
      dexNum: row['dex_num'],
      type: (row['type'] != null)
          ? (row['type'] as String).split(',').map((e) => PokemonType.fromString(e)).toList()
          : <PokemonType>[],
      category: (row['category'] != null)
          ? MoveCategory.values.firstWhere((e) => e.toString().split('.').last == row['category'])
          : MoveCategory.error,
      target: row['target'] != null
          ? MoveTarget.values.firstWhere((e) => e.toString().split('.').last == row['target'])
          : MoveTarget.error,
      power: row['power'],
      accuracy: row['accuracy'],
      priority: row['priority'],
      pp: row['pp'],
      shortDescription: row['short_description'],
      longDescription: row['long_description'],
      hasSecondaryEffect: row['has_secondary_effect'] == 1,
      isMultiHit: row['is_multi_hit'] == 1,
      multiHitHigh: row['multi_hit_high'],
      multiHitLow: row['multi_hit_low'],
      ignoresSubstitute: row['ignores_substitute'] == 1,
      ignoresProtect: row['ignores_protect'] == 1,
      bounceable: row['bounceable'] == 1,
      bite: row['bite'] == 1,
      bullet: row['bullet'] == 1,
      contact: row['contact'] == 1,
      dance: row['dance'] == 1,
      heal: row['heal'] == 1,
      powder: row['powder'] == 1,
      pulse: row['pulse'] == 1,
      punch: row['punch'] == 1,
      slice: row['slice'] == 1,
      sound: row['sound'] == 1,
      wind: row['wind'] == 1,
      boostedBySheerForce: row['boosted_by_sheer_force'] == 1,
      ohko: row['ohko'] == 1,
      isZmove: row['is_z_move'] == 1,
      isMaxMove: row['is_max_move'] == 1,
      isLegal: row['is_legal'] == 1,
    );
  }
}