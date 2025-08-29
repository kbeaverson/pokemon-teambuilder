import 'package:app/model/static_models/move_pool_entry.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/utils/powersync_util.dart';

class MovePoolRepoPowersync extends MovePoolRepo {

  @override
  Future<MovePoolEntry?> getById(String movePoolEntryId) async {
    final result = await db.get(
      'SELECT * FROM movepools WHERE id = ?',
      [movePoolEntryId],
    );
    if (result.isEmpty) {
      return null;
    }
    return MovePoolEntry.fromRow(result);
  }

  @override
  Future<List<MovePoolEntry>> getByMove(String moveId) async {
    final results = await db.getAll(
      'SELECT * FROM movepools WHERE move_id = ?',
      [moveId],
    );
    return results.map((e) => MovePoolEntry.fromRow(e)).toList();
  }

  @override
  Future<MovePoolEntry?> getByPair(String pokemonId, String moveId) async {
    final result = await db.get(
      'SELECT * FROM movepools WHERE pokemon_id = ? AND move_id = ?',
      [pokemonId, moveId],
    );
    if (result.isEmpty) {
      return null;
    }
    return MovePoolEntry.fromRow(result);
  }

  @override
  Future<List<MovePoolEntry>> getByPokemon(String pokemonId) async {
    final results = await db.getAll(
      'SELECT * FROM movepools WHERE pokemon_id = ?',
      [pokemonId],
    );
    return results.map((e) => MovePoolEntry.fromRow(e)).toList();
  }

  @override
  Future<MovePoolEntry?> getNoPokemonEntry(String moveId) async {
    final result = await db.get(
      'SELECT * FROM movepools WHERE move_id = ? AND pokemon_id IS NULL',
      [moveId],
    );
    if (result.isEmpty) {
      return null;
    }
    return MovePoolEntry.fromRow(result);
  }
}