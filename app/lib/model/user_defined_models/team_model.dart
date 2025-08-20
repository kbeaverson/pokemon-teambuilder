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
    @Default([]) List<String> memberIds,
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
      memberIds: List.filled(6, ''),
    );
  }

  factory Team.fromRowWithMembers(sqlite.Row row, List<String> memberIds) {
    return Team(
      id: row['id'],
      name: row['name'] ?? "Untitled",
      description: row['description'],
      memberIds: memberIds,
      regulationId: row['regulation_id'],
      rentalCode: row['rental_code'],
      isDirty: row['is_dirty'] == 1,
    );
  }
}