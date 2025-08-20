import 'package:app/model/static_models/item_model.dart';
import 'package:app/utils/enums/item_category.dart';
import 'package:app/utils/string_extension.dart';
import 'package:flutter/material.dart';

/// ViewModel for item objects
class ItemViewModel extends ChangeNotifier {
  ItemViewModel({required this.item});

  final Item item;

  String get spritePath => 'assets/item_sprites/${item.name}.png';

  String get name => item.name;
  String get id => item.id;
  int get dexNum => item.dexNum;
  int get flingPower => item.flingPower;
  bool get ignoredByKlutz => item.ignoredByKlutz;
  String get description => item.description;
  List<ItemCategory> get category => item.category;

  String get formattedName => item.name.toTitleCase();
}