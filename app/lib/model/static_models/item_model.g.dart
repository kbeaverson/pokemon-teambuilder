// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
      id: json['id'] as String,
      name: json['name'] as String,
      dexNum: (json['dexNum'] as num).toInt(),
      description: json['description'] as String,
      flingPower: (json['flingPower'] as num).toInt(),
      ignoredByKlutz: json['ignoredByKlutz'] as bool,
      category: (json['category'] as List<dynamic>)
          .map((e) => $enumDecode(_$ItemCategoryEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dexNum': instance.dexNum,
      'description': instance.description,
      'flingPower': instance.flingPower,
      'ignoredByKlutz': instance.ignoredByKlutz,
      'category':
          instance.category.map((e) => _$ItemCategoryEnumMap[e]!).toList(),
    };

const _$ItemCategoryEnumMap = {
  ItemCategory.healing: 'healing',
  ItemCategory.boosting: 'boosting',
  ItemCategory.choice: 'choice',
  ItemCategory.berry: 'berry',
  ItemCategory.consumable: 'consumable',
};
