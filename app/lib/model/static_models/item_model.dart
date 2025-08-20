import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;
import '../../utils/enums/item_category.dart';

part 'item_model.freezed.dart';

/// Item model that provides immutable, canonical data about a held item
@freezed
abstract class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
    required int dexNum,
    required String description,
    required int flingPower,
    required bool ignoredByKlutz,
    required List<ItemCategory> category,
  }) = _Item;

  factory Item.fromRow(sqlite.Row row) {
    return Item(
      id: row['id'],
      name: row['name'], 
      dexNum: row['dex_num'], 
      flingPower: row['fling_power'], 
      description: row['description'],
      ignoredByKlutz: row['ignored_by_klutz'] == 1, 
      category: (row['category'] != null)
          ? (row['category'] as String).split(',').map((e) => ItemCategory.values.firstWhere((c) => c.toString() == 'ItemCategory.$e')).toList()
          : [],
    );
  }
}