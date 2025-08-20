import 'package:app/model/static_models/regulation_model.dart';

abstract class RegulationRepo {
  /// Get regulation by id
  Future<Regulation?> getById(String id);
  /// Get all regulations
  Future<List<Regulation>> getAll();
}