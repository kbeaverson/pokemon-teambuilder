import 'package:app/model/calculator_side_model.dart';
import 'package:app/model/move_model.dart';
import 'package:app/utils/side_name.dart';
import 'package:app/utils/terrain.dart';
import 'package:app/utils/weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_model.freezed.dart';
/// Damage calculator object
@freezed
abstract class Calculator with _$Calculator {
  const factory Calculator({
    required CalculatorSide left,
    required CalculatorSide right,
    Move? attackingMove,
    @Default(false) bool criticalHit,
    @Default(false) bool guaranteedCrit,
    SideName? attacker,
    String? resultString,
    List<int>? damageRange,
    Weather? weather,
    Terrain? terrain,
    @Default(false) bool gravity,
    @Default(false) bool neutralizingGas,
    @Default(false) bool swordOfRuin,
    @Default(false) bool beadsOfRuin,
    @Default(false) bool tabletsOfRuin,
    @Default(false) bool vesselOfRuin,
    @Default(false) bool auraBreak,
    @Default(false) bool darkAura,
    @Default(false) bool fairyAura,
  }) = _Calculator;
}