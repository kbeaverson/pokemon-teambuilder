import 'package:app/model/static_models/move_pool_entry.dart';

abstract class MovePoolRepo {
  /// The move pool entries for a pokemon.
  /// 
  /// Produces list of MovePoolEntry for every move that the pokemon corresponding to [pokemonId] can learn.
  Future<List<MovePoolEntry>> getByPokemon(String pokemonId);
  /// The move pool entries for all pokemon that learn a move.
  /// 
  /// Produces list of MovePoolEntry for every pokemon that can learn the move corresponding to [moveId].
  Future<List<MovePoolEntry>> getByMove(String moveId);

  /// The move pool entry corresponding to the entry id, if it exists.
  Future<MovePoolEntry?> getById(String movePoolEntryId);

  /// The move pool entry corresponding to the pokemon and move pair, if it exists.
  Future<MovePoolEntry?> getByPair(String pokemonId, String moveId);

  /// The move pool entry corresponding to the move with no attached pokemon, if it exists.
  Future<MovePoolEntry?> getNoPokemonEntry(String moveId);
}