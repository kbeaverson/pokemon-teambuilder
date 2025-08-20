import 'package:app/model/static_models/pokemon_model.dart';

abstract class PokemonRepo {
  /// Get all pokemon from the database
  Future<List<Pokemon>> getAll();
  /// Get pokemon by id from the database
  Future<Pokemon?> getById(String id);
}