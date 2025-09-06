/// The learn method for a move
enum LearnMethod {
  levelup,
  egg,
  tm,
  none;

  String get spritePath {
    switch (this) {
      case LearnMethod.levelup:
        return 'assets/move_sprites/learn_method/levelup.png';
      case LearnMethod.egg:
        return 'assets/move_sprites/learn_method/egg.png';
      case LearnMethod.tm:
        return 'assets/move_sprites/learn_method/tm.png';
      default:
        return 'assets/move_sprites/learn_method/none.png'; 
    }
  }
}