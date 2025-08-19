import 'package:app/model/move_model.dart';
import 'package:app/model/move_pool_entry.dart';
import 'package:app/model/pokemon_model.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/utils/enums/learn_method.dart';
import 'package:app/utils/string_extension.dart';
import 'package:app/viewmodel/move_viewmodel.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';

/// ViewModel for move pool entry objects
class MovePoolEntryViewModel extends ChangeNotifier {
  MovePoolEntryViewModel({
    required this.movePoolEntry,
    required this.moveRepo,
    required this.pokemonRepo,
  }) {
    _loadRelatedData();
  }

  final MovePoolEntry movePoolEntry;
  final MoveRepo moveRepo;
  final PokemonRepo pokemonRepo;

  Move? _move;
  Pokemon? _pokemon;

  String? get moveId => movePoolEntry.moveId;
  String? get pokemonId => movePoolEntry.pokemonId;
  int? get levelupLevel => movePoolEntry.levelupLevel;
  LearnMethod? get learnMethod => movePoolEntry.learnMethod;
  MoveViewModel? get moveViewModel => _move != null ? MoveViewModel(move: _move!) : null;
  PokemonViewModel? get pokemonViewModel => _pokemon != null ? PokemonViewModel(pokemon: _pokemon!) : null;

  bool get moveIsPresent => _move != null;
  bool get pokmeonIsPresent => _pokemon != null;
  String get moveName => _move?.name ?? 'Loading...'; // FIXME: Handle loading state properly
  String get pokemonName => _pokemon?.name ?? 'Loading...';
  MaterialColor? get moveTypeColor => _move?.type.first.color;
  String? get learnMethodSpritePath => movePoolEntry.learnMethod?.spritePath;
  String? get moveTypeIconPath => _move?.type.first.iconSpritePath;
  String? get moveTypeBarPath => _move?.type.first.barSpritePath;
  String? get moveCategorySpritePath => _move?.category.spritePath;

  String get formattedMoveName => _move?.name.toTitleCase() ?? 'Loading...'; // FIXME: Also handle loading state here
  String get formattedPokemonName => _pokemon?.name.toTitleCase() ?? 'Loading...';

  /// TODO: Loads related move and pokemon data from the repositories.
  Future<void> _loadRelatedData() async {}
}