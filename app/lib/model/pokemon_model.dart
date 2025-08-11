import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../utils/pokemon_type.dart';
part 'pokemon_model.freezed.dart';

/// Pokemon model that provides immutable, canonical data about a pokemon species
@freezed
class Pokemon with _$Pokemon {
  const Pokemon({
    required this.id, 
    required this.name, 
    required this.dexNum, 
    required this.type, 
    required this.isPreEvolution, 
    required this.weight, 
    required this.genderRatio, 
    required this.isMythical, 
    required this.isLegendary, 
    required this.isMax, 
    required this.isMega, 
    required this.mandatoryItemName, 
    required this.baseHP, 
    required this.baseAtk, 
    required this.baseDef, 
    required this.baseSpA, 
    required this.baseSpD, 
    required this.baseSpe,
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
  final bool isPreEvolution;
  @override
  final double weight;
  @override
  final int genderRatio;
  @override
  final bool isMythical;
  @override
  final bool isLegendary;
  @override
  final bool isMax;
  @override
  final bool isMega;
  @override
  final String? mandatoryItemName;
  @override
  final int baseHP;
  @override
  final int baseAtk;
  @override
  final int baseDef;
  @override
  final int baseSpA;
  @override
  final int baseSpD;
  @override
  final int baseSpe;
}
