import 'package:app/model/static_models/item_model.dart';

abstract class ItemRepo {
  /// Get all items from the database
  Future<List<Item>> getAll();
  /// Get item by id from the database
  Future<Item?> getById(String id);
}