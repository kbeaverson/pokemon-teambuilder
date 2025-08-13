import 'package:app/model/slot_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'team_model.freezed.dart';
/// Object that maintains all customizable components of a pokemon team
@freezed
abstract class Team with _$Team{
  const factory Team ({
    required String id,
    @Default("Untitled") String name,
    String? description,
    required List<Slot> members,
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
      members: List.filled(6, Slot.newSlot()),
    );
  }
}