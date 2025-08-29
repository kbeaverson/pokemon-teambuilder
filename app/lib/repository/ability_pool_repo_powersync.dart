import 'package:app/model/static_models/ability_pool_entry_model.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/utils/powersync_util.dart';

class AbilityPoolRepoPowersync extends AbilityPoolRepo {
  @override
  Future<List<AbilityPoolEntry>> getByAbility(String abilityId) async {
    final results = await db.getAll(
      'SELECT * FROM abilitypools WHERE ability_id = ?',
      [abilityId],
    );
    return results.map((e) => AbilityPoolEntry.fromRow(e)).toList();
  }

  @override
  Future<AbilityPoolEntry?> getById(String id) async {
    final result = await db.get(
      'SELECT * FROM abilitypools WHERE id = ?',
      [id],
    );
    if (result.isEmpty) {
      return null;
    }
    return AbilityPoolEntry.fromRow(result);
  }

  @override
  Future<AbilityPoolEntry?> getByPair(String pokemonId, String abilityId) async {
    final result = await db.get(
      'SELECT * FROM abilitypools WHERE pokemon_id = ? AND ability_id = ?',
      [pokemonId, abilityId],
    );
    if (result.isEmpty) {
      return null;
    }
    return AbilityPoolEntry.fromRow(result);
  }

  @override
  Future<List<AbilityPoolEntry>> getByPokemon(String pokemonId) async {
    final results = await db.getAll(
      'SELECT * FROM abilitypools WHERE pokemon_id = ?',
      [pokemonId],
    );
    return results.map((e) => AbilityPoolEntry.fromRow(e)).toList();
  }

  @override
  Future<AbilityPoolEntry?> getNoPokemonEntry(String abilityId) async {
    final result = await db.get(
      'SELECT * FROM abilitypools WHERE ability_id = ? AND pokemon_id IS NULL',
      [abilityId],
    );
    if (result.isEmpty) {
      return null;
    }
    return AbilityPoolEntry.fromRow(result);
  }
}