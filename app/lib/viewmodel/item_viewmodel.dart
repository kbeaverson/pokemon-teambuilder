import 'package:app/model/item_model.dart';
import 'package:flutter/material.dart';

/// ViewModel for item objects
class ItemViewModel extends ChangeNotifier {
  ItemViewModel({required this.item});

  final Item item;

  String get spritePath => 'assets/item_sprites/${item.name}.png';
}