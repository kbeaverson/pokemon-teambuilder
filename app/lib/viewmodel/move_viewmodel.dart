import 'package:app/model/move_model.dart';
import 'package:flutter/material.dart';

/// ViewModel for move objects
class MoveViewModel extends ChangeNotifier {
  MoveViewModel({required this.move});

  final Move move;
}