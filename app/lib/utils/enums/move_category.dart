/// Move category tags
enum MoveCategory {
  physical,
  special,
  status,
  error; // Used for invalid or unrecognized categories

  String get spritePath {
    switch (this) {
      case MoveCategory.physical:
        return 'assets/move_sprites/move_category/physical.png';
      case MoveCategory.special:
        return 'assets/move_sprites/move_category/special.png';
      case MoveCategory.status:
        return 'assets/move_sprites/move_category/status.png';
      case MoveCategory.error:
        return ''; // FIXME: Find placeholder for error category
    }
  }
}