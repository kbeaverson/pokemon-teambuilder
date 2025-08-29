import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

part 'team_model.freezed.dart';
/// Object that maintains all customizable components of a pokemon team
@freezed
abstract class Team with _$Team{
  const factory Team ({
    required String id,
    @Default("Untitled") String name,
    String? description,
    @Default({
      0: null,
      1: null,
      2: null,
      3: null,
      4: null,
      5: null,
    }) Map<int, String?> memberIds,
    String? regulationId,
    String? rentalCode,
    @Default(true) bool isDirty,
  }) = _Team;

  factory Team.newTeam({
    String name = "Untitled",
    String? description,
    String? regulationId,
    String? rentalCode,
    bool isDirty = true,
  }) {
    return Team(
      id: const Uuid().v4(),
      name: name,
      description: description,
      regulationId: regulationId,
      rentalCode: rentalCode,
      isDirty: isDirty,
      memberIds: {
        0: null,
        1: null,
        2: null,
        3: null,
        4: null,
        5: null,
      },
    );
  }

  factory Team.fromRow(sqlite.Row row) {
    return Team(
      id: row['id'],
      name: row['name'] ?? "Untitled",
      description: row['description'],
      memberIds: Map<int, String?>.from((jsonDecode(row['member_ids']) as Map).map((key, value) => MapEntry(int.parse(key), value))),
      regulationId: row['regulation_id'],
      rentalCode: row['rental_code'],
      isDirty: row['is_dirty'] == 1,
    );
  }
}