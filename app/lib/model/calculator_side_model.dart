import 'package:app/model/slot_model.dart';
import 'package:app/utils/status_condition.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_side_model.freezed.dart';
/// Object representing one side of a battlefield in pokemon
@freezed
abstract class CalculatorSide with _$CalculatorSide {
  const factory CalculatorSide({
    required Slot slot,
    @Default(100) int healthPercent,
    StatusCondition? statusCondition,
    @Default(0) int atkStage,
    @Default(0) int defStage,
    @Default(0) int spaStage,
    @Default(0) int spdStage,
    @Default(0) int speStage,
    @Default(0) int spikes,
    @Default(false) bool helpingHand,
    @Default(false) bool auroraVeil,
    @Default(false) bool reflect,
    @Default(false) bool lightScreen,
    @Default(false) bool tailwind,
    @Default(false) bool swamp,
    @Default(false) bool seaOfFire,
    @Default(false) bool friendGuard,
    @Default(false) bool stealthRocks,
    @Default(false) bool steelySpirit,
    @Default(false) bool powerSpot,
    @Default(false) bool battery,
    @Default(false) bool saltCure,
    @Default(false) bool commander,
    @Default(false) bool geomancy,
    @Default(false) bool extremeEvoBoost,
    @Default(false) bool gmaxField,
    @Default(false) bool flowerGift,
  }) = _CalculatorSide;
}