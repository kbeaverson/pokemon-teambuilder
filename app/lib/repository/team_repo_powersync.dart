import 'dart:convert';

import 'package:app/model/user_defined_models/team_model.dart';
import 'package:app/repository/repo_contracts/slot_repo.dart';
import 'package:app/repository/repo_contracts/team_repo.dart';
import 'package:app/utils/powersync_util.dart';

class TeamRepoPowersync extends TeamRepo {
  TeamRepoPowersync(this.slotRepo);

  final SlotRepo slotRepo;

  @override
  Future<void> createTeam(Team team, String userId) async {
    await db.execute(
      'INSERT INTO teams (id, name, regulation_id, rental_code, description) VALUES (?, ?, ?, ?, ?)',
      [team.id, team.name, team.regulationId, team.rentalCode, team.description],
    );

    await db.execute(
      'INSERT INTO user_teams (user_id, team_id) VALUES (?, ?)',
      [userId, team.id],
    );

    for (int i = 0; i < 6; i++) { // FIXME: Come back to this when team size becomes modular
      await db.execute(
        'INSERT INTO team_slots (team_id, slot_id) VALUES (?, ?)',
        [team.id, team.memberIds[i]],
      );
    }
  }

  @override
  Future<void> deleteTeam(String teamId) async {
    await db.execute(
      'DELETE FROM teams WHERE id = ?',
      [teamId],
    );

    await slotRepo.deleteSlotsByTeam(teamId);
  }

  @override
  Future<Team?> getById(String teamId) async {
    final team = await db.get(
      'SELECT * FROM teams WHERE id = ?',
      [teamId],
    );
    return team.isNotEmpty ? Team.fromRow(team) : null;
  }

  @override
  Future<List<Team>> getByUser(String userId) {
    // TODO: implement getByUser
    // FIXME: I don't think this is necessary, as powersync will only grab the teams for the logged in user
    throw UnimplementedError();
  }

  @override
  Future<void> updateTeam(Team team) async {
    await db.execute('UPDATE teams SET name = ?, regulation_id = ?, rental_code = ?, description = ?, member_ids = ? WHERE id = ?',
      [team.name, team.regulationId, team.rentalCode, team.description, jsonEncode(team.memberIds), team.id],
    );
  }
}