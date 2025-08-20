import 'package:app/model/static_models/ability_model.dart';

abstract class AbilityRepo {
  /// Get all abilities from the database
  Future<List<Ability>> getAll();
  /// Get ability by its id from the database
  Future<Ability?> getById(String id);
}