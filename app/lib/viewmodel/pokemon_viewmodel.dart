import 'package:app/model/pokemon_model.dart';
import 'package:app/utils/enums/pokemon_type.dart';
import 'package:app/utils/string_extension.dart';
import 'package:flutter/material.dart';

/// ViewModel for Pokemon objects
class PokemonViewModel extends ChangeNotifier {
  PokemonViewModel({required Pokemon pokemon}) : _pokemon = pokemon;

  final Pokemon _pokemon;
  
  Pokemon get pokemon => _pokemon; // Expose the underlying model when needed for selection from a list
  String get id => _pokemon.id;
  String get spritePath => 'assets/pokemon_sprites/${_pokemon.name}.png';
  String get name => _pokemon.name;
  int get dexNum => _pokemon.dexNum;
  List<PokemonType> get type => _pokemon.type;
  bool get isPreEvolution => _pokemon.isPreEvolution;
  double get weight => _pokemon.weight;
  int get genderRatio => _pokemon.genderRatio;
  bool get isMythical => _pokemon.isMythical;
  bool get isLegendary => _pokemon.isLegendary;
  bool get isMax => _pokemon.isMax;
  bool get isMega => _pokemon.isMega;
  String? get mandatoryItemName => _pokemon.mandatoryItemName;
  int get baseHP => _pokemon.baseHP;
  int get baseAtk => _pokemon.baseAtk;
  int get baseDef => _pokemon.baseDef;
  int get baseSpA => _pokemon.baseSpA;
  int get baseSpD => _pokemon.baseSpD;
  int get baseSpe => _pokemon.baseSpe;

  String get formattedName => _pokemon.name.toTitleCase();

  MaterialColor get primaryColor {
    // Use the first type's color for the Pokemon
    return _pokemon.type.isNotEmpty ? _pokemon.type.first.color : Colors.grey;
  }

  MaterialColor get secondaryColor {
    // Use the second type's color if available, otherwise fallback to primary
    return _pokemon.type.length > 1 ? _pokemon.type[1].color : primaryColor;
  }
}