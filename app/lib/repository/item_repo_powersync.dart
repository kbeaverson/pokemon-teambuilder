import 'package:app/model/static_models/item_model.dart';
import 'package:app/repository/repo_contracts/item_repo.dart';
import 'package:app/utils/powersync_util.dart';

class ItemRepoPowersync extends ItemRepo {
  @override
  Future<List<Item>> getAll() async {
    final results = await db.getAll(
      'SELECT * FROM items',
    );
    return results.map((e) => Item.fromRow(e)).toList();
  }

  @override
  Future<Item?> getById(String id) async {
    final result = await db.get(
      'SELECT * FROM items WHERE id = ?',
      [id],
    );
    if (result.isEmpty) {return null;}
    return Item.fromRow(result);
  }
}