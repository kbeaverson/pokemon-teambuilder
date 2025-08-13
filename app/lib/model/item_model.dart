import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/item_category.dart';

part 'item_model.freezed.dart';

/// Item model that provides immutable, canonical data about a held item
@freezed
class Item with _$Item {
  const Item({
    required this.id,
    required this.name,
    required this.dexNum,
    required this.flingPower,
    required this.ignoredByKlutz,
    required this.category,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final int dexNum;
  @override
  final int flingPower;
  @override
  final bool ignoredByKlutz;
  @override
  final List<ItemCategory> category;
}