// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pokemon _$PokemonFromJson(Map<String, dynamic> json) => _Pokemon(
      id: json['id'] as String,
      name: json['name'] as String,
      dexNum: (json['dexNum'] as num).toInt(),
      type: (json['type'] as List<dynamic>)
          .map((e) => $enumDecode(_$PokemonTypeEnumMap, e))
          .toList(),
      isPreEvolution: json['isPreEvolution'] as bool,
      weight: (json['weight'] as num).toDouble(),
      genderRatio: (json['genderRatio'] as num).toDouble(),
      isMythical: json['isMythical'] as bool,
      isLegendary: json['isLegendary'] as bool,
      isMax: json['isMax'] as bool,
      isMega: json['isMega'] as bool,
      mandatoryItemName: json['mandatoryItemName'] as String?,
      baseHP: (json['baseHP'] as num).toInt(),
      baseAtk: (json['baseAtk'] as num).toInt(),
      baseDef: (json['baseDef'] as num).toInt(),
      baseSpA: (json['baseSpA'] as num).toInt(),
      baseSpD: (json['baseSpD'] as num).toInt(),
      baseSpe: (json['baseSpe'] as num).toInt(),
      baseSpeciesId: json['baseSpeciesId'] as String?,
      prevoId: json['prevoId'] as String?,
    );

Map<String, dynamic> _$PokemonToJson(_Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dexNum': instance.dexNum,
      'type': instance.type.map((e) => _$PokemonTypeEnumMap[e]!).toList(),
      'isPreEvolution': instance.isPreEvolution,
      'weight': instance.weight,
      'genderRatio': instance.genderRatio,
      'isMythical': instance.isMythical,
      'isLegendary': instance.isLegendary,
      'isMax': instance.isMax,
      'isMega': instance.isMega,
      'mandatoryItemName': instance.mandatoryItemName,
      'baseHP': instance.baseHP,
      'baseAtk': instance.baseAtk,
      'baseDef': instance.baseDef,
      'baseSpA': instance.baseSpA,
      'baseSpD': instance.baseSpD,
      'baseSpe': instance.baseSpe,
      'baseSpeciesId': instance.baseSpeciesId,
      'prevoId': instance.prevoId,
    };

const _$PokemonTypeEnumMap = {
  PokemonType.normal: 'normal',
  PokemonType.fire: 'fire',
  PokemonType.water: 'water',
  PokemonType.grass: 'grass',
  PokemonType.electric: 'electric',
  PokemonType.ice: 'ice',
  PokemonType.fighting: 'fighting',
  PokemonType.poison: 'poison',
  PokemonType.ground: 'ground',
  PokemonType.flying: 'flying',
  PokemonType.psychic: 'psychic',
  PokemonType.bug: 'bug',
  PokemonType.rock: 'rock',
  PokemonType.ghost: 'ghost',
  PokemonType.dragon: 'dragon',
  PokemonType.dark: 'dark',
  PokemonType.steel: 'steel',
  PokemonType.fairy: 'fairy',
  PokemonType.stellar: 'stellar',
  PokemonType.typeless: 'typeless',
};
