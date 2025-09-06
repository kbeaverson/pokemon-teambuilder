// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_pool_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AbilityPoolEntry _$AbilityPoolEntryFromJson(Map<String, dynamic> json) =>
    _AbilityPoolEntry(
      id: json['id'] as String,
      abilityId: json['abilityId'] as String?,
      pokemonId: json['pokemonId'] as String?,
      isHidden: json['isHidden'] as bool,
    );

Map<String, dynamic> _$AbilityPoolEntryToJson(_AbilityPoolEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'abilityId': instance.abilityId,
      'pokemonId': instance.pokemonId,
      'isHidden': instance.isHidden,
    };
