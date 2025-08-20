import 'package:app/model/static_models/move_model.dart';

abstract class MoveRepo {
  /// Get all moves from database
  Future<List<Move>> getAll();
  /// Get move by id from database
  Future<Move?> getById(String id);
}