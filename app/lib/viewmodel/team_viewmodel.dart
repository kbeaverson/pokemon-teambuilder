import 'package:app/model/user_defined_models/slot_model.dart';
import 'package:app/model/user_defined_models/team_model.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/repository/repo_contracts/item_repo.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/repository/repo_contracts/regulation_repo.dart';
import 'package:app/repository/repo_contracts/slot_repo.dart';
import 'package:app/repository/repo_contracts/team_repo.dart';
import 'package:app/viewmodel/slot_viewmodel.dart';
import 'package:flutter/material.dart';

class TeamViewModel extends ChangeNotifier {
  TeamViewModel({
    required this.team,
    required this.slotRepo,
    required this.teamRepo,
    required this.regulationRepo,
    required this.pokemonRepo,
    required this.moveRepo,
    required this.abilityRepo,
    required this.itemRepo,
    required this.movePoolRepo,
    required this.abilityPoolRepo,
  }) {
    _loadRelatedData();
  }

  Team team;
  final SlotRepo slotRepo;
  final TeamRepo teamRepo;
  final RegulationRepo regulationRepo;
  final PokemonRepo pokemonRepo;
  final MoveRepo moveRepo;
  final AbilityRepo abilityRepo;
  final ItemRepo itemRepo;
  final MovePoolRepo movePoolRepo;
  final AbilityPoolRepo abilityPoolRepo;

  final Map<int, SlotViewModel?> _slotViewModels = {
    0 : null,
    1 : null,
    2 : null,
    3 : null,
    4 : null,
    5 : null,
  };

  /// Responsibilities:
  /// - Regulation enforcement
  /// - Export as team sheet/paste
  
  String get id => team.id;

  String get name => team.name;
  Future<void> setName(String name) async {
    final updatedTeam = team.copyWith(name: name);
    await teamRepo.updateTeam(updatedTeam);
    team = updatedTeam;
    notifyListeners();
  }

  String? get rentalCode => team.rentalCode;
  Future<void> setRentalCode(String? code) async {
    final updatedTeam = team.copyWith(rentalCode: code);
    await teamRepo.updateTeam(updatedTeam);
    team = updatedTeam;
    notifyListeners();
  }
  
  String? get description => team.description;
  Future<void> setDescription(String? description) async {
    final updatedTeam = team.copyWith(description: description);
    await teamRepo.updateTeam(updatedTeam);
    team = updatedTeam;
    notifyListeners();
  }

  String? get regulationId => team.regulationId;
  Future<void> setRegulationId(String? regulationId) async {
    final updatedTeam = team.copyWith(regulationId: regulationId);
    await teamRepo.updateTeam(updatedTeam);
    team = updatedTeam;
    notifyListeners();
  }

  Future<void> _loadRelatedData() async {
    loadMembers();
  }

  Future<void> loadMembers() async {
    for (final memberEntry in team.memberIds.entries) {
      if (memberEntry.value != null) {
        final slot = await slotRepo.getById(memberEntry.value!);
        if (slot != null) {
          _slotViewModels[memberEntry.key] = SlotViewModel(slot: slot, slotRepo: slotRepo, pokemonRepo: pokemonRepo, movePoolRepo: movePoolRepo, abilityPoolRepo: abilityPoolRepo, itemRepo: itemRepo, moveRepo: moveRepo, abilityRepo: abilityRepo);
          notifyListeners();
        } else {
          // TODO: Handle missing slot case
        }
      } else {
        _slotViewModels[memberEntry.key] = SlotViewModel(
          slot: Slot.newSlot(teamId: team.id),
          slotRepo: slotRepo,
          pokemonRepo: pokemonRepo,
          movePoolRepo: movePoolRepo,
          abilityPoolRepo: abilityPoolRepo,
          itemRepo: itemRepo,
          moveRepo: moveRepo,
          abilityRepo: abilityRepo,
        );
        notifyListeners();
      }
    }
  }

  Future<void> reorderMembers(int indexA, int indexB) async {
    if (indexA == indexB) return;

    final slotA = _slotViewModels[indexA];
    final slotB = _slotViewModels[indexB];

    final newOrderIds = team.memberIds;
    newOrderIds[indexA] = slotB?.slot.id;
    newOrderIds[indexB] = slotA?.slot.id;

    final updatedTeam = team.copyWith(memberIds: newOrderIds);
    await teamRepo.updateTeam(updatedTeam);
    team = updatedTeam;
    notifyListeners();
  }

  Future<Team> duplicateTeam(String userId) async {
    Team newTeam = Team.newTeam();
    final duplicatedTeam = team.copyWith(id: newTeam.id, name: "${team.name} Copy", isDirty: true);
    await teamRepo.createTeam(duplicatedTeam, userId);
    return duplicatedTeam;
  }

  Future<void> deleteTeam() async {
    await teamRepo.deleteTeam(team.id);
  }
}