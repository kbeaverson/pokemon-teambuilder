import 'dart:core';

import 'package:app/utils/pokemon_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/move_category.dart';
import '../utils/move_target.dart';
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
    required int multiHitHigh,
    required int multiHitLow,
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
}