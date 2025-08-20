import 'package:app/model/user_defined_models/team_model.dart';
import 'package:app/utils/enums/clause_type.dart';

/// Abstract class that validates for a single rule on a team
abstract class Clause {
  const Clause ({
    required this.id,
    required this.descriptionMessage,
  });

  final String id;
  final String descriptionMessage;

  ClauseType get clauseType;
  String? get violationMessage;
  Map<String, dynamic> toJson();
  bool validate(Team team);
}
