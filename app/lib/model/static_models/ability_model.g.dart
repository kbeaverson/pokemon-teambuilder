// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ability _$AbilityFromJson(Map<String, dynamic> json) => _Ability(
      id: json['id'] as String,
      name: json['name'] as String,
      dexNum: (json['dexNum'] as num).toInt(),
      description: json['description'] as String,
      blockedByNeutGas: json['blockedByNeutGas'] as bool,
      ignored: json['ignored'] as bool,
    );

Map<String, dynamic> _$AbilityToJson(_Ability instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dexNum': instance.dexNum,
      'description': instance.description,
      'blockedByNeutGas': instance.blockedByNeutGas,
      'ignored': instance.ignored,
    };
