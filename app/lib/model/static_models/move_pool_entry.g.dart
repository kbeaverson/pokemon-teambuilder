// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_pool_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovePoolEntry _$MovePoolEntryFromJson(Map<String, dynamic> json) =>
    _MovePoolEntry(
      id: json['id'] as String?,
      moveId: json['moveId'] as String?,
      pokemonId: json['pokemonId'] as String?,
      learnMethod:
          $enumDecodeNullable(_$LearnMethodEnumMap, json['learnMethod']),
      levelupLevel: (json['levelupLevel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovePoolEntryToJson(_MovePoolEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'moveId': instance.moveId,
      'pokemonId': instance.pokemonId,
      'learnMethod': _$LearnMethodEnumMap[instance.learnMethod],
      'levelupLevel': instance.levelupLevel,
    };

const _$LearnMethodEnumMap = {
  LearnMethod.levelup: 'levelup',
  LearnMethod.egg: 'egg',
  LearnMethod.tm: 'tm',
  LearnMethod.tutor: 'tutor',
  LearnMethod.none: 'none',
};
