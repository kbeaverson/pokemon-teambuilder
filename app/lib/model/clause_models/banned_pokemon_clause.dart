import 'package:app/model/clause_models/clause_model.dart';
import 'package:app/model/team_model.dart';
import 'package:app/utils/enums/clause_type.dart';

/// Enforces a banned-pokemon rule for a Regulation
class BannedPokemonClause extends Clause {
  const BannedPokemonClause({
    required super.id,
    required super.descriptionMessage,
    required this.bannedPokemonDexNums,
  });

  final List<String> bannedPokemonDexNums;

  @override
  ClauseType get clauseType => ClauseType.bannedPokemon;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descriptionMessage': descriptionMessage,
      'bannedPokemonDexNums': bannedPokemonDexNums,
      'clauseType': clauseType.toString(),
    };
  }

  @override
  bool validate(Team team) {
    // TODO: implement validate
    throw UnimplementedError();
  }

  @override
  // TODO: implement violationMessage
  String? get violationMessage => throw UnimplementedError();
}