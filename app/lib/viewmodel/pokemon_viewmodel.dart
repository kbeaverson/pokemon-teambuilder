import 'package:app/model/pokemon_model.dart';
import 'package:flutter/material.dart';

/// ViewModel for Pokemon objects
class PokemonViewModel extends ChangeNotifier {
  PokemonViewModel({required this.pokemon});

  final Pokemon pokemon;
  
  String get spritePath => 'assets/pokemon_sprites/${pokemon.name}.png';
}