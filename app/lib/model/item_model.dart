import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/item_category.dart';

part 'item_model.freezed.dart';

/// Item model that provides immutable, canonical data about a held item
@freezed
abstract class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
    required int dexNum,
    required int flingPower,
    required bool ignoredByKlutz,
    required List<ItemCategory> category,
  }) = _Item;
}