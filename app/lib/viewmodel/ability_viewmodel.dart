import 'package:app/model/static_models/ability_model.dart';
import 'package:app/utils/string_extension.dart';
import 'package:flutter/material.dart';

/// ViewModel for ability objects
class AbilityViewModel extends ChangeNotifier {
  AbilityViewModel({required this.ability});

  final Ability ability;

  String get name => ability.name;
  String get description => ability.description;
  String get id => ability.id;
  int get dexNum => ability.dexNum;
  bool get blockedByNeutGas => ability.blockedByNeutGas;
  bool get ignored => ability.ignored;

  String get formattedName => ability.name.toTitleCase();
}