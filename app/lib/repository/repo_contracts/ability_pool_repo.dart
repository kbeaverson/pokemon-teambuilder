import 'package:app/model/static_models/ability_pool_entry_model.dart';

abstract class AbilityPoolRepo {
  /// The ability pool entries for a pokemon.
  /// 
  /// Produces list of AbilityPoolEntry for every ability that the pokemon corresponding to [pokemonId] can have.
  Future<List<AbilityPoolEntry>> getByPokemon(String pokemonId);
  /// The ability pool entries for all pokemon that can have an ability.
  /// 
  /// Produces list of AbilityPoolEntry for every pokemon that can have the ability corresponding to [abilityId].
  Future<List<AbilityPoolEntry>> getByAbility(String abilityId);

  /// Gets an ability pool entry by its ID.
  Future<AbilityPoolEntry?> getById(String id);
}