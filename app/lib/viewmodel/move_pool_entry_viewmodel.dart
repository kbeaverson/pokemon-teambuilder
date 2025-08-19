import 'package:app/model/move_pool_entry.dart';
import 'package:app/utils/enums/learn_method.dart';
import 'package:flutter/material.dart';

/// ViewModel for move pool entry objects
class MovePoolEntryViewModel extends ChangeNotifier {
  MovePoolEntryViewModel({required this.movePoolEntry});

  final MovePoolEntry movePoolEntry;

  int? get levelupLevel => movePoolEntry.levelupLevel;

  String get spritePath {
    LearnMethod learnMethod = movePoolEntry.learnMethod;
    switch (learnMethod) {
      case LearnMethod.egg: return 'assets/sprites/move_sprites/egg.png';
      case LearnMethod.tm: return 'assets/sprites/move_sprites/tm.png';
      case LearnMethod.levelup: return 'assets/sprites/move_sprites/levelup.png';
    }
  }
}