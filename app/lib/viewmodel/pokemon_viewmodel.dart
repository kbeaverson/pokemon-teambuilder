import 'package:app/model/static_models/ability_model.dart';
import 'package:app/model/static_models/ability_pool_entry_model.dart';
import 'package:app/model/static_models/move_pool_entry.dart';
import 'package:app/model/static_models/pokemon_model.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/utils/enums/pokemon_type.dart';
import 'package:app/utils/string_extension.dart';
import 'package:flutter/material.dart';

/// ViewModel for Pokemon objects
class PokemonViewModel extends ChangeNotifier {
  PokemonViewModel({required Pokemon pokemon, required MovePoolRepo movePoolRepo, required PokemonRepo pokemonRepo, required AbilityPoolRepo abilityPoolRepo})
      : _pokemon = pokemon,
        _movePoolRepo = movePoolRepo,
        _pokemonRepo = pokemonRepo,
        _abilityPoolRepo = abilityPoolRepo;

  final Pokemon _pokemon;
  final MovePoolRepo _movePoolRepo;
  final PokemonRepo _pokemonRepo;
  final AbilityPoolRepo _abilityPoolRepo;

  List<MovePoolEntry> _movePool = []; // Populated externally after initialization
  bool _isLoadingMovePool = false;
  List<MovePoolEntry> get movePool => _movePool;
  bool get isMovePoolLoaded => !_isLoadingMovePool;

  List<AbilityPoolEntry> _abilityPool = []; // Populated externally after initialization
  bool _isLoadingAbilityPool = false;
  List<AbilityPoolEntry> get abilityPool => _abilityPool;
  bool get isAbilityPoolLoaded => !_isLoadingAbilityPool;
  
  Pokemon get pokemon => _pokemon; // Expose the underlying model when needed for selection from a list
  String get id => _pokemon.id;
  String? get baseSpeciesId => _pokemon.baseSpeciesId;
  String? get prevoId => _pokemon.prevoId;
  String get spritePath => 'assets/pokemon_sprites/unprocessed/${_pokemon.dexNum}.png';
  String get name => _pokemon.name;
  int get dexNum => _pokemon.dexNum;
  List<PokemonType> get type => _pokemon.type;
  bool get isPreEvolution => _pokemon.isPreEvolution;
  double get weight => _pokemon.weight;
  double get genderRatio => _pokemon.genderRatio;
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
  int get baseStatsTotal => _pokemon.baseHP + _pokemon.baseAtk + _pokemon.baseDef + _pokemon.baseSpA + _pokemon.baseSpD + _pokemon.baseSpe;


  String get formattedName => _pokemon.name.toTitleCase();

  MaterialColor get primaryColor {
    // Use the first type's color for the Pokemon
    return _pokemon.type.isNotEmpty ? _pokemon.type.first.color : Colors.grey;
  }

  MaterialColor get secondaryColor {
    // Use the second type's color if available, otherwise fallback to primary
    return _pokemon.type.length > 1 ? _pokemon.type[1].color : primaryColor;
  }

  Future<void> loadMovePool() async {
    _isLoadingMovePool = true;
    notifyListeners();
    try {
      // Helper to recursively collect movepools starting from a species id up the prevo chain.
      // Returns a list of pairs (pokemonId, movepoolEntries) where earlier items are older prevos.
      Future<List<List<MovePoolEntry>>> _collectPrevos(String startId) async {
        final List<List<MovePoolEntry>> collected = [];
        String? currentId = startId;
        // Walk up the prevo chain; stop if we hit a pokemon without a prevo or a loop.
        final seen = <String>{};
        while (currentId != null && !seen.contains(currentId)) {
          seen.add(currentId);
            // Load movepool for this currentId (may return empty list)
            final pool = await _movePoolRepo.getByPokemon(currentId);
          if (pool.isNotEmpty) collected.add(pool);

          // Fetch the pokemon to see if it has a prevo
          final p = await _pokemonRepo.getById(currentId);
          if (p == null) break;
          currentId = p.prevoId;
        }
        return collected;
      }

      // Start with the species id (baseSpeciesId if present otherwise the pokemon id)
      final speciesId = _pokemon.baseSpeciesId ?? _pokemon.id;

      // Collect movepools from this species and its prevos. The list is ordered from main -> prevo -> pre-prevo...
      final collected = await _collectPrevos(speciesId);

      // Merge movepools so that moves from the earlier list (main pokemon) take precedence over later prevos.
      // We'll key by a normalized move name to determine uniqueness, keeping the lowest level encountered from main first.
      final Map<String, MovePoolEntry> mergedByMove = {};

      String _normalizeMoveName(String name) => name.trim().toLowerCase();

      for (final pool in collected) {
        for (final entry in pool) {
          final key = _normalizeMoveName(entry.moveId ?? '');
          // If we don't have this move yet, or the existing entry comes from a later prevo (higher index), keep the current
          if (!mergedByMove.containsKey(key)) {
            mergedByMove[key] = entry;
          } else {
            // If the existing entry is from a prevo and this entry is from a more-derived pokemon (earlier in collected),
            // we should prefer the existing one because collected is ordered main -> prevo -> pre-prevo.
            // Since we process collected in order, first occurrence wins, so nothing to do here.
          }
        }
      }

      // The merged list should reflect the main pokemon's moves first; preserve insertion order from above map.
      _movePool = mergedByMove.values.toList();
    } catch (e) {
      // If any error occurs, ensure we leave the state consistent and rethrow or log as needed. For now, just clear.
      _movePool = [];
    } finally {
      _isLoadingMovePool = false;
      notifyListeners();
    }
  }

  Future<void> loadAbilityPool() async {
    _isLoadingAbilityPool = true;
    notifyListeners();
    try {
      // Load ability pool for this pokemon
      final pool = await _abilityPoolRepo.getByPokemon(_pokemon.id);
      _abilityPool = pool;
    } catch (e) {
      _abilityPool = [];
    } finally {
      _isLoadingAbilityPool = false;
      notifyListeners();
    }
  }
}