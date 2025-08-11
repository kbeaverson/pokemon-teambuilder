import 'dart:core';

import 'package:app/utils/pokemon_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/move_category.dart';
import '../utils/move_target.dart';
part 'move_model.freezed.dart';

/// Move model that provides immutable, canonical data about a pokemon move
@freezed
class Move with _$Move {
  const Move({
    required this.id,
    required this.name,
    required this.dexNum,
    required this.type,
    required this.category,
    required this.target,
    required this.power,
    required this.accuracy,
    required this.priority,
    required this.pp,
    required this.shortDescription,
    required this.longDescription,
    required this.hasSecondaryEffect,
    required this.isMultiHit,
    required this.multiHitHigh,
    required this.multiHitLow,
    required this.ignoresSubstitute,
    required this.ignoresProtect,
    required this.bounceable,
    required this.bite,
    required this.bullet,
    required this.contact,
    required this.dance,
    required this.heal,
    required this.powder,
    required this.pulse,
    required this.punch,
    required this.slice,
    required this.sound,
    required this.wind,
    required this.boostedBySheerForce,
    required this.ohko,
    required this.isZmove,
    required this.isMaxMove,
    required this.isLegal,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final int dexNum;
  @override
  final List<PokemonType> type;
  @override
  final MoveCategory category;
  @override
  final MoveTarget target;
  @override
  final int power;
  @override
  final int accuracy;
  @override
  final int priority;
  @override
  final int pp;
  @override
  final String shortDescription;
  @override
  final String longDescription;
  @override
  final bool hasSecondaryEffect;
  @override
  final bool isMultiHit;
  @override
  final int? multiHitHigh;
  @override
  final int? multiHitLow;
  @override
  final bool ignoresSubstitute;
  @override
  final bool ignoresProtect;
  @override
  final bool bounceable;
  @override
  final bool bite;
  @override
  final bool bullet;
  @override
  final bool contact;
  @override
  final bool dance;
  @override
  final bool heal;
  @override
  final bool powder;
  @override
  final bool pulse;
  @override
  final bool punch;
  @override
  final bool slice;
  @override
  final bool sound;
  @override
  final bool wind;
  @override
  final bool boostedBySheerForce;
  @override
  final bool ohko;
  @override
  final bool isZmove;
  @override
  final bool isMaxMove;
  @override
  final bool isLegal;
}