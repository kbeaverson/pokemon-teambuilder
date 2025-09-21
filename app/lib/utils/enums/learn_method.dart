/// The learn method for a move
enum LearnMethod {
  levelup,
  egg,
  tm,
  tutor,
  none;

  String get spritePath {
    switch (this) {
      case LearnMethod.levelup:
        return 'assets/move_sprites/learn_method/levelup.png';
      case LearnMethod.egg:
        return 'assets/move_sprites/learn_method/egg.png';
      case LearnMethod.tm:
        return 'assets/move_sprites/learn_method/tm.png';
      case LearnMethod.tutor:
        // return 'assets/move_sprites/learn_method/tutor.png';
        // TODO: Placeholder until we have a tutor icon
      default:
        return 'assets/move_sprites/learn_method/none.png'; 
    }
  }
}