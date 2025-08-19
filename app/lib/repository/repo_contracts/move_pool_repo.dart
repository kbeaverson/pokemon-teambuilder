import 'package:app/model/move_pool_entry.dart';

abstract class MovePoolRepo {
  /// The move pool entries for a pokemon.
  /// 
  /// Produces list of MovePoolEntry for every move that the pokemon corresponding to [pokemonId] can learn.
  Future<List<MovePoolEntry>> getByPokemon(String pokemonId);
  /// The move pool entries for all pokemon that learn a move.
  /// 
  /// Produces list of MovePoolEntry for every pokemon that can learn the move corresponding to [moveId].
  Future<List<MovePoolEntry>> getByMove(String moveId);
}