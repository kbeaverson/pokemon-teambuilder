import 'package:app/model/ability_model.dart';
import 'package:flutter/material.dart';

/// ViewModel for ability objects
class AbilityViewModel extends ChangeNotifier {
  AbilityViewModel({required this.ability});

  final Ability ability;
}