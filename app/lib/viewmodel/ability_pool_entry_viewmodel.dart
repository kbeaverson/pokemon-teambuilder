import 'package:app/model/ability_pool_entry_model.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/utils/string_extension.dart';
import 'package:app/viewmodel/ability_viewmodel.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';

import '../model/ability_model.dart';
import '../model/pokemon_model.dart';

/// ViewModel for ability pool entry objects
class AbilityPoolEntryViewModel extends ChangeNotifier {
  AbilityPoolEntryViewModel({
    required this.abilityPoolEntry,
    required this.pokemonRepo,
    required this.abilityRepo,
  }) {_loadRelatedData();}

  final AbilityPoolEntry abilityPoolEntry;
  final PokemonRepo pokemonRepo;
  final AbilityRepo abilityRepo;

  Pokemon? _pokemon;
  Ability? _ability;

  bool get isHidden => abilityPoolEntry.isHidden;
  String get abilityName => _ability?.name ?? 'Loading...'; // FIXME: Handle loading state properly
  String get pokemonName => _pokemon?.name ?? 'Loading...';
  PokemonViewModel? get pokemonViewModel => _pokemon != null ? PokemonViewModel(pokemon: _pokemon!) : null;
  AbilityViewModel? get abilityViewModel => _ability != null ? AbilityViewModel(ability: _ability!) : null;

  bool get abilityIsPresent => _ability != null;
  bool get pokemonIsPresent => _pokemon != null;

  String get formattedAbilityName => _ability?.name.toTitleCase() ?? 'Loading...'; // FIXME: Handle loading state properly
  String get formattedPokemonName => _pokemon?.name.toTitleCase() ?? 'Loading...';

  /// Provides the sprite path for the hidden status of this ability pool entry.
  /// 
  /// If the ability is hidden, it returns the path for the hidden ability sprite.
  /// Otherwise, it returns the path for the normal ability sprite.
  String get spritePath => abilityPoolEntry.isHidden ? 'assets/sprites/ability_sprites/ability-patch.png' : 'assets/sprites/ability_sprites/ability-capsule.png';

  /// TODO: Loads related pokemon and ability data from the repositories.
  Future<void> _loadRelatedData() async {}

  /// Data needed from AbilityPoolEntryViewModel:
  /// - Ability id
  /// - Ability name (capitalized)
  /// - isHidden status
  /// - isHidden sprite path
  /// - Ability object
}