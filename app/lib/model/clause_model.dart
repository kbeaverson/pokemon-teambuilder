import 'package:app/utils/clause_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Object that checks validates for a single rule in a Regulation
abstract class Clause with _$Clause {
  final String id;
  final ClauseType clauseType;
  final String message;
  final String? violationMessage;
  final bool 
}