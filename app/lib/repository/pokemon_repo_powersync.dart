import 'package:app/model/pokemon_model.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/utils/powersync_util.dart';

class PokemonRepoPowersync extends PokemonRepo {
  @override
  Future<List<Pokemon>> getAll() async {
    final results = await db.getAll( 
      'SELECT * FROM pokemon',
    );
    return results.map((row) => Pokemon.fromRow(row)).toList();
  }

  @override
  Future<Pokemon?> getById(String id) async {
    final result = await db.get('SELECT * FROM pokemon WHERE id = ?', [id]);
    if (result.isEmpty) return null;
    return Pokemon.fromRow(result);
  }
}