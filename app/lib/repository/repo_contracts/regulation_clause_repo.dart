import 'package:app/model/static_models/clause_models/clause_model.dart';

abstract class RegulationClauseRepo {
  /// Get all clauses
  Future<List<Clause>> getAll();
  /// Get clause by id
  Future<Clause?> getById(String id);
  /// Get all clauses for a regulation
  Future<List<Clause>> getForRegulation(String regulationId);
}