import 'package:app/model/static_models/move_model.dart';
import 'package:app/model/static_models/move_pool_entry.dart';
import 'package:app/model/static_models/pokemon_model.dart';
import 'package:app/model/user_defined_models/slot_model.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/repository/repo_contracts/item_repo.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/repository/repo_contracts/slot_repo.dart';
import 'package:app/utils/enums/learn_method.dart';
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

  final Map<int, MovePoolEntryViewModel?> _movePoolEntryViewModels = {
    0: null,
    1: null,
    2: null,
    3: null,
  };

  MovePoolEntryViewModel? getMovePoolEntry(int index) {
    return _movePoolEntryViewModels[index];
  }

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

    // FIXME: Adding a pokemon needs to check if moves, abilities, items, and gimmicks are legal
  }

  Future<void> clearPokemon() async {
    final updatedSlot = slot.copyWith(pokemonId: null);
    await slotRepo.updateSlot(updatedSlot);
    _pokemonViewModel = null;
    slot = updatedSlot;
    notifyListeners();
  }

  Future<void> setMove(int index, Move move) async {
    /// Need to handle the following cases:
    /// - Pokemon selected before selecting move -> MovePoolEntry can be found for pokemon/move pair
    if (_pokemonViewModel != null) {
      final movePoolEntry = await movePoolRepo.getByPair(_pokemonViewModel!.pokemon.id, move.id);
      if (movePoolEntry != null) {
        final updatedSlot = slot.copyWith(movePoolEntryIds: {
          ...slot.movePoolEntryIds,
          index: movePoolEntry.id,
        });
        _movePoolEntryViewModels[index] = MovePoolEntryViewModel(movePoolEntry: movePoolEntry, moveRepo: moveRepo, pokemonRepo: pokemonRepo);
        slot = updatedSlot;
        notifyListeners();
      }
    }
    /// - Move selected before selecting Pokemon -> MovePoolEntry won't have id in database, unless each move is entered into the database with pokemon ids being blank
    else {
      final movePoolEntry = await movePoolRepo.getNoPokemonEntry(move.id);
      if (movePoolEntry != null) {
        final updatedSlot = slot.copyWith(movePoolEntryIds: {
          ...slot.movePoolEntryIds,
          index: movePoolEntry.id,
        });
        _movePoolEntryViewModels[index] = MovePoolEntryViewModel(movePoolEntry: movePoolEntry, moveRepo: moveRepo, pokemonRepo: pokemonRepo);
        slot = updatedSlot;
        notifyListeners();
      }
    }
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
    for (var entry in slot.movePoolEntryIds.entries) {
      final movePoolEntry = await movePoolRepo.getById((entry.value) ?? '');
      if (movePoolEntry != null) {
        _movePoolEntryViewModels[entry.key] = MovePoolEntryViewModel(movePoolEntry: movePoolEntry, moveRepo: moveRepo, pokemonRepo: pokemonRepo);
        notifyListeners();
      }
    }
  }

  Future<void> loadAbility() async {
    if (slot.abilityPoolEntryId == null) {
      _abilityPoolEntryViewModel = null;
      notifyListeners();
      return;
    }

    final abilityPoolEntry = await abilityPoolRepo.getById(slot.abilityPoolEntryId!);
    if (abilityPoolEntry != null) {
      _abilityPoolEntryViewModel = AbilityPoolEntryViewModel(abilityPoolEntry: abilityPoolEntry, abilityRepo: abilityRepo, pokemonRepo: pokemonRepo);
      notifyListeners();
    } else {
      _abilityPoolEntryViewModel = null;
      notifyListeners();
    }
  }

  Future<void> loadItem() async {
    if (slot.itemId == null) {
      _itemViewModel = null;
      notifyListeners();
      return;
    }

    final item = await itemRepo.getById(slot.itemId!);
    if (item != null) {
      _itemViewModel = ItemViewModel(item: item);
      notifyListeners();
    } else {
      _itemViewModel = null;
      notifyListeners();
    }
  }

  
}