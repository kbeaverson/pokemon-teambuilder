import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_model.freezed.dart';

/// Ability model that provides immutable, canonical data about a pokemon ability
@freezed
class Ability with _$Ability {
  const Ability({
    required this.id,
    required this.name,
    required this.dexNum,
    required this.description,
    required this.blockedByNeutGas,
    required this.ignored,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final int dexNum;
  @override
  final String description;
  @override
  final bool blockedByNeutGas;
  @override
  final bool ignored;
}