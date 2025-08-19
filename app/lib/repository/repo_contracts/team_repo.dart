import 'package:app/model/team_model.dart';

abstract class TeamRepo {
  /// Get team by id
  Future<Team?> getById(String teamId);
  /// Get all teams for user
  Future<List<Team>> getByUser(String userId);
  /// Create new team for user
  Future<void> createTeam(Team team, String userId);
  /// Update team
  Future<void> updateTeam(Team team);
  /// Delete team
  Future<void> deleteTeam(String teamId);
}