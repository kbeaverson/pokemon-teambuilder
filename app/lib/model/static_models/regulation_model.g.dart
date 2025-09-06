// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regulation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Regulation _$RegulationFromJson(Map<String, dynamic> json) => _Regulation(
      id: json['id'] as String,
      name: json['name'] as String,
      clauseIds:
          (json['clauseIds'] as List<dynamic>).map((e) => e as String).toList(),
      isDynamaxLegal: json['isDynamaxLegal'] as bool,
      isMegaLegal: json['isMegaLegal'] as bool,
      isTeraLegal: json['isTeraLegal'] as bool,
    );

Map<String, dynamic> _$RegulationToJson(_Regulation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'clauseIds': instance.clauseIds,
      'isDynamaxLegal': instance.isDynamaxLegal,
      'isMegaLegal': instance.isMegaLegal,
      'isTeraLegal': instance.isTeraLegal,
    };
