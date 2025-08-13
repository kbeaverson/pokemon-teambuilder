import 'package:app/model/ability_model.dart';
import 'package:app/model/pokemon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_pool_entry_model.freezed.dart';

/// An ability/pokemon pair that contains whether the ability is the pokemon's hidden ability
@freezed
class AbilityPoolEntry with _$AbilityPoolEntry {
  const AbilityPoolEntry ({
    required this.ability,
    required this.pokemon,
    required this.isHidden,
  });

  @override
  final Ability ability;
  @override
  final Pokemon pokemon;
  @override
  final bool isHidden;
}