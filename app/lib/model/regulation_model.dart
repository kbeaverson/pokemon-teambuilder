import 'package:freezed_annotation/freezed_annotation.dart';

part 'regulation_model.freezed.dart';
/// Object that defines legality of pokemon, items, moves, etc. for a ruleset
@freezed
class Regulation with _$Regulation {
  const Regulation({
    required this.id,
    required this.name,
    required this.clauses,
    required this.isDynamaxLegal,
    required this.isMegaLegal,
    required this.isTeraLegal,
  });

  final String id;
  final String name;
  final List<Clause> clauses;
  final bool isDynamaxLegal;
  final bool isMegaLegal;
  final bool isTeraLegal;
}