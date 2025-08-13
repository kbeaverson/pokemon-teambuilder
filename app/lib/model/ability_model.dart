import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_model.freezed.dart';

/// Ability model that provides immutable, canonical data about a pokemon ability
@freezed
abstract class Ability with _$Ability {
  const factory Ability({
    required String id,
    required String name,
    required int dexNum,
    required String description,
    required bool blockedByNeutGas,
    required bool ignored,
  }) = _Ability;
}