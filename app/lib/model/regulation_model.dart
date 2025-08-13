import 'package:app/model/clause_models/clause_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'regulation_model.freezed.dart';
/// Object that defines legality of pokemon, items, moves, etc. for a ruleset
@freezed
abstract class Regulation with _$Regulation {
  const factory Regulation({
    required String id,
    required String name,
    required List<Clause> clauses,
    required bool isDynamaxLegal,
    required bool isMegaLegal,
    required bool isTeraLegal,
  }) = _Regulation;
}