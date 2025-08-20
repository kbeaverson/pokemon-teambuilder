import 'package:app/model/static_models/move_model.dart';
import 'package:app/utils/enums/pokemon_type.dart';
import 'package:app/utils/string_extension.dart';
import 'package:flutter/material.dart';

import '../utils/enums/move_category.dart';
import '../utils/enums/move_target.dart';
import '../utils/pokedex_colors.dart';

/// ViewModel for move objects
class MoveViewModel extends ChangeNotifier {
  MoveViewModel({required this.move});

  final Move move;

  String get name => move.name;
  String get id => move.id;
  int get dexNum => move.dexNum;
  List<PokemonType> get type => move.type;
  String get shortDescription => move.shortDescription;
  String get longDescription => move.longDescription;
  MoveCategory get category => move.category;
  MoveTarget get target => move.target;
  int get priority => move.priority;
  int get power => move.power;
  int get accuracy => move.accuracy;
  int get pp => move.pp;
  bool get hasSecondaryEffect => move.hasSecondaryEffect;
  bool get isMultiHit => move.isMultiHit;
  int? get multiHitHigh => move.multiHitHigh;
  int? get multiHitLow => move.multiHitLow;
  bool get ignoresSubstitute => move.ignoresSubstitute;
  bool get isZMove => move.isZmove;
  bool get isMaxMove => move.isMaxMove;
  bool get ignoresProtect => move.ignoresProtect;
  bool get bounceable => move.bounceable;
  bool get bite => move.bite;
  bool get bullet => move.bullet;
  bool get contact => move.contact;
  bool get dance => move.dance;
  bool get heal => move.heal;
  bool get powder => move.powder;
  bool get pulse => move.pulse;
  bool get punch => move.punch;
  bool get slice => move.slice;
  bool get sound => move.sound;
  bool get wind => move.wind;
  bool get boostedBySheerForce => move.boostedBySheerForce;
  bool get ohko => move.ohko;
  bool get isLegal => move.isLegal;

  String get formattedName => move.name.toTitleCase();
  String get formattedAccuracy => move.accuracy == 0 ? '—' : '${move.accuracy}%';
  String get formattedPower => move.power == 0 ? '—' : '${move.power}';
  String get formattedPriority {
    if (move.priority == 0) return '—';
    return move.priority > 0 ? '+${move.priority}' : '${move.priority}';
  }
  String get formattedMultiHit {
    if (move.multiHitHigh == null || move.multiHitLow == null) return '—';
    return '${move.multiHitLow}-${move.multiHitHigh}';
  }

  String get categorySpritePath => move.category.spritePath;
  MaterialColor get typeColor => PokedexColors.getByName(move.type.first.name);
}