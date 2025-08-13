import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../utils/pokemon_type.dart';
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
}
