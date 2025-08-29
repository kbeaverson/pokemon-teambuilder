import 'package:app/model/static_models/move_model.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/utils/powersync_util.dart';

class MoveRepoPowersync extends MoveRepo {
  @override
  Future<List<Move>> getAll() async {
    final results = await db.getAll(
      'SELECT * FROM moves',
    );
    return results.map((e) => Move.fromRow(e)).toList();
  }

  @override
  Future<Move?> getById(String id) async {
    final result = await db.get(
      'SELECT * FROM moves WHERE id = ?',
      [id],
    );
    if (result.isEmpty) {return null;}
    return Move.fromRow(result);
  }
  
}