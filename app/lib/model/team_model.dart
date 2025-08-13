import 'package:app/model/slot_model.dart';
import 'package:uuid/uuid.dart';

/// Object that maintains all customizable components of a pokemon team
class Team {
  Team ({
    String? id,
    this.name = "Untitled",
    this.description,
    List<Slot>? members,
    this.regulation,
    this.rentalCode,
    this.isDirty = true,
  }) : id = id ?? const Uuid().v4(),
      members = members ?? [];

  final String id;
  String name;
  String? description;
  List<Slot> members;
  Regulation regulation;
  String? rentalCode;
  bool isDirty;
}