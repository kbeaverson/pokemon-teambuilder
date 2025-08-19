import 'package:app/utils/pokedex_colors.dart';
import 'package:flutter/material.dart';

/// Pokemon type
enum PokemonType {
  normal,
  fire,
  water,
  grass,
  electric,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
  stellar,
  typeless;

  String get name => toString().split('.').last;

  static PokemonType fromString(String type) {
    return PokemonType.values.firstWhere(
      (e) => e.name == type.toLowerCase(),
      orElse: () => PokemonType.typeless,
    );
  }

  String get barSpritePath => 'assets/type_sprites/type_bars/${name}.png';
  String get iconSpritePath => 'assets/type_sprites/type_icons/${name}Icon.png';

  MaterialColor get color => PokedexColors.getByName(name);
}