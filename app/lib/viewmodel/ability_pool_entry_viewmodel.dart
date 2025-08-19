import 'package:app/model/ability_pool_entry_model.dart';
import 'package:flutter/material.dart';

/// ViewModel for ability pool entry objects
class AbilityPoolEntryViewModel extends ChangeNotifier {
  AbilityPoolEntryViewModel({required this.abilityPoolEntry});

  final AbilityPoolEntry abilityPoolEntry;

  String get spritePath => abilityPoolEntry.isHidden ? 'assets/sprites/ability_sprites/ability-patch.png' : 'assets/sprites/ability_sprites/ability-capsule.png';
}