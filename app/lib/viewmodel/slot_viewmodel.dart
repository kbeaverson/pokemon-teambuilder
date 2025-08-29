import 'package:app/model/static_models/ability_model.dart';
import 'package:app/model/static_models/item_model.dart';
import 'package:app/model/static_models/move_model.dart';
import 'package:app/model/static_models/pokemon_model.dart';
import 'package:app/model/user_defined_models/slot_model.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/repository/repo_contracts/item_repo.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/repository/repo_contracts/slot_repo.dart';
import 'package:app/utils/enums/nature.dart';
import 'package:app/utils/enums/pokemon_type.dart';
import 'package:app/utils/enums/stat.dart';
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

  String get id => slot.id;
  String? get teamId => slot.teamId;
  Nature get nature => slot.nature;
  bool get isGigantamax => slot.isGigantamax;
  PokemonType? get teraType => slot.teraType;
  String? get notes => slot.notes;
  Map<Stat, int> get ivs => slot.ivs;
  Map<Stat, int> get evs => slot.evs;

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
  AbilityPoolEntryViewModel? _abilityPoolEntryViewModel;
  AbilityPoolEntryViewModel? get abilityPoolEntryViewModel => _abilityPoolEntryViewModel;
  ItemViewModel? _itemViewModel;
  ItemViewModel? get itemViewModel => _itemViewModel;

  /// TODO:
  /// - Duplicate slot
  /// - Clear slot
  /// - Edit notes

  Future<void> setNature(Nature nature) async {
    final updatedSlot = slot.copyWith(nature: nature);
    await slotRepo.updateSlot(updatedSlot);
    slot = updatedSlot;
    notifyListeners();
  }

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
    if (_pokemonViewModel != null) { // - Pokemon selected before selecting move -> MovePoolEntry can be found for pokemon/move pair
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
    } else { // - Move selected before selecting Pokemon -> MovePoolEntry won't have id in database, unless each move is entered into the database with pokemon ids being blank
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
  
  Future<void> clearMove(int index) async {
    final updatedSlot = slot.copyWith(movePoolEntryIds: {
      ...slot.movePoolEntryIds,
      index: null, // Clear the move by setting it to null
    });
    await slotRepo.updateSlot(updatedSlot);
    _movePoolEntryViewModels[index] = null; // Clear the ViewModel for this move
    slot = updatedSlot;
    notifyListeners();
  }

  Future<void> setAbility(Ability ability) async {
    if (_pokemonViewModel != null) { // Pokemon is selected
      final abilityPoolEntry = await abilityPoolRepo.getByPair(_pokemonViewModel!.pokemon.id, ability.id);
      if (abilityPoolEntry != null) {
        final updatedSlot = slot.copyWith(abilityPoolEntryId: abilityPoolEntry.id);
        await slotRepo.updateSlot(updatedSlot);
        _abilityPoolEntryViewModel = AbilityPoolEntryViewModel(abilityPoolEntry: abilityPoolEntry, abilityRepo: abilityRepo, pokemonRepo: pokemonRepo);
        slot = updatedSlot;
        notifyListeners();
      }
    } else { // No pokemon is selected
      final abilityPoolEntry = await abilityPoolRepo.getNoPokemonEntry(ability.id);
      if (abilityPoolEntry != null) {
        final updatedSlot = slot.copyWith(abilityPoolEntryId: abilityPoolEntry.id);
        await slotRepo.updateSlot(updatedSlot);
        _abilityPoolEntryViewModel = AbilityPoolEntryViewModel(abilityPoolEntry: abilityPoolEntry, abilityRepo: abilityRepo, pokemonRepo: pokemonRepo);
        slot = updatedSlot;
        notifyListeners();
      }
    }
  }

  Future<void> clearAbility() async {
    final updatedSlot = slot.copyWith(abilityPoolEntryId: null);
    await slotRepo.updateSlot(updatedSlot);
    _abilityPoolEntryViewModel = null; // Clear the ViewModel for this ability
    slot = updatedSlot;
    notifyListeners();
  }

  Future<void> setItem(Item item) async {
    final updatedSlot = slot.copyWith(itemId: item.id);
    await slotRepo.updateSlot(updatedSlot);
    _itemViewModel = ItemViewModel(item: item);
    slot = updatedSlot;
    notifyListeners();
  }

  Future<void> clearItem() async {
    final updatedSlot = slot.copyWith(itemId: null);
    await slotRepo.updateSlot(updatedSlot);
    _itemViewModel = null; // Clear the ViewModel for this item
    slot = updatedSlot;
    notifyListeners();
  }

  /// Loads related data for the slot, such as pokemon, moves, abilities, and items.
  Future<void> _loadRelatedData() async {
    loadPokemon();
    loadMoves();
    loadAbility();
    loadItem();
  }

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