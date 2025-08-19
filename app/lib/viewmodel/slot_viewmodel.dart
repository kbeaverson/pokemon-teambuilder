import 'package:app/model/slot_model.dart';
import 'package:flutter/material.dart';

/// ViewModel for slot objects
class SlotViewModel extends ChangeNotifier {
  SlotViewModel({required this.slot});

  final Slot slot;

  /// Need methods that allow for changes to all fields:
  /// - Pokemon
  /// - Move
  /// - Ability
  /// - Item
  /// - Stats (EVs/IVs/Nature)
  /// - Tera type
  /// - Gigantamax
  /// - Notes
  /// - isDirty?
}