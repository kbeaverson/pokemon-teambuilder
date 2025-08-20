import 'package:app/model/static_models/pokemon_model.dart';
import 'package:app/model/user_defined_models/slot_model.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/repository/repo_contracts/item_repo.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/repository/repo_contracts/slot_repo.dart';
import 'package:app/utils/powersync_util.dart';
import 'package:app/viewmodel/ability_pool_entry_viewmodel.dart';
import 'package:app/viewmodel/item_viewmodel.dart';
import 'package:app/viewmodel/move_pool_entry_viewmodel.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';

/// ViewModel for slot objects
class SlotViewModel extends ChangeNotifier {
  SlotViewModel({
    required this.slot,
    required this.slotRepo,
    required this.pokemonRepo,
    required this.movePoolRepo,
    required this.abilityPoolRepo,
    required this.itemRepo,
    required this.moveRepo,
    required this.abilityRepo,
  }) {
    _loadRelatedData();
  }

  Slot slot;
  final SlotRepo slotRepo;
  final PokemonRepo pokemonRepo;
  final MovePoolRepo movePoolRepo;
  final AbilityPoolRepo abilityPoolRepo;
  final ItemRepo itemRepo;
  final MoveRepo moveRepo;
  final AbilityRepo abilityRepo;

  PokemonViewModel? _pokemonViewModel;
  PokemonViewModel? get pokemonViewModel => _pokemonViewModel;

  List<MovePoolEntryViewModel> _movePoolEntryViewModels = [];
  List<MovePoolEntryViewModel> get movePoolEntryViewModels => _movePoolEntryViewModels;

  ItemViewModel? _itemViewModel;
  AbilityPoolEntryViewModel? _abilityPoolEntryViewModel;

  Future<void> setPokemon(Pokemon pokemon) async {
    final updatedSlot = slot.copyWith(pokemonId: pokemon.id);
    await slotRepo.updateSlot(updatedSlot);
    _pokemonViewModel = PokemonViewModel(pokemon: pokemon);
    slot = updatedSlot;
    notifyListeners();
    // Reactive alternative:
    // await slotRepo.updateSlot(slot.copyWith(pokemonId: pokemon.id));
    // await loadPokemon();
  }

  Future<void> clearPokemon() async {
    final updatedSlot = slot.copyWith(pokemonId: null);
    await slotRepo.updateSlot(updatedSlot);
    _pokemonViewModel = null;
    slot = updatedSlot;
    notifyListeners();
  }
  
  /// TODO: Loads related data for the slot, such as pokemon, moves, abilities, and items.
  Future<void> _loadRelatedData() async {}

  /// Loads the Pokemon for this slot and creates a PokemonViewModel
  Future<void> loadPokemon() async {
    if (slot.pokemonId == null) { // If no Pokemon is selected, set to null
      _pokemonViewModel = null;
      notifyListeners();
      return;
    }

    final pokemon = await pokemonRepo.getById(slot.pokemonId!); // Can now be sure that pokemonId is not null
    if (pokemon != null) { // If a Pokemon is found, create the ViewModel
      _pokemonViewModel = PokemonViewModel(pokemon: pokemon);
      notifyListeners();
    } else { // If no Pokemon is found, set to null
      _pokemonViewModel = null;
      notifyListeners();
    }
  }

  Future<void> loadMoves() async {
    if (slot.movePoolEntryIds.isEmpty) {
      _movePoolEntryViewModels = [];
      notifyListeners();
    }

    for (String id in slot.movePoolEntryIds) {
      final movePoolEntry = await movePoolRepo.getById(id);
      if (movePoolEntry != null) { // Entry found, add to list
        _movePoolEntryViewModels.add(MovePoolEntryViewModel(movePoolEntry: movePoolEntry, moveRepo: moveRepo, pokemonRepo: pokemonRepo));
      }
    }
  }
}