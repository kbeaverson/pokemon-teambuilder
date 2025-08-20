import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

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

  factory Ability.fromRow(sqlite.Row row) {
    return Ability(
      id: row['id'],
      name: row['name'],
      dexNum: row['dex_num'],
      description: row['description'],
      blockedByNeutGas: row['blocked_by_neut_gas'] == 1,
      ignored: row['ignored'] == 1,
    );
  }
}