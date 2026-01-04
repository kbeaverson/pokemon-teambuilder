import 'package:app/model/static_models/ability_pool_entry_model.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/ui/widgets/abilitypool_info_card.dart';
import 'package:app/viewmodel/ability_pool_entry_viewmodel.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonAbilitypoolView extends StatefulWidget {
  final PokemonViewModel pokemonViewModel;
  const PokemonAbilitypoolView({super.key, required this.pokemonViewModel});

  @override
  State<PokemonAbilitypoolView> createState() => _PokemonAbilitypoolViewState();
}

class _PokemonAbilitypoolViewState extends State<PokemonAbilitypoolView> {
  late PokemonRepo _pokemonRepo;
  late AbilityRepo _abilityRepo;
  late AbilityPoolRepo _abilityPoolRepo;
  late MovePoolRepo _movePoolRepo;
  PokemonViewModel get viewModel => widget.pokemonViewModel;

  @override
  void initState() {
    super.initState();
    viewModel.addListener(_onViewModelChanged);
    viewModel.loadAbilityPool();
    _pokemonRepo = Provider.of<PokemonRepo>(context, listen: false);
    _abilityRepo = Provider.of<AbilityRepo>(context, listen: false);
    _abilityPoolRepo = Provider.of<AbilityPoolRepo>(context, listen: false);
    _movePoolRepo = Provider.of<MovePoolRepo>(context, listen: false);
  }

  @override
  void dispose() {
    viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  void _onViewModelChanged() {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<AbilityPoolEntry> sorted = viewModel.abilityPool;
    sorted.sort((a, b) => a.isHidden ? 1 : -1);

    return ListView.builder(
      itemCount: sorted.length,
      itemBuilder: (context, index) {
        final entry = sorted[index];
        return _AbilityPoolEntryTile(
          abilityPoolEntry: entry,
          pokemonRepo: _pokemonRepo,
          abilityPoolRepo: _abilityPoolRepo,
          movePoolRepo: _movePoolRepo,
          abilityRepo: _abilityRepo,
        );
      },
    );
  }
}

class _AbilityPoolEntryTile extends StatefulWidget {
  final dynamic abilityPoolEntry;
  final dynamic pokemonRepo;
  final dynamic movePoolRepo;
  final dynamic abilityRepo;
  final dynamic abilityPoolRepo;

  const _AbilityPoolEntryTile({
    required this.abilityPoolEntry,
    required this.pokemonRepo,
    required this.movePoolRepo,
    required this.abilityRepo,
    required this.abilityPoolRepo,
  });

  @override
  State<_AbilityPoolEntryTile> createState() => _AbilityPoolEntryTileState();
}

class _AbilityPoolEntryTileState extends State<_AbilityPoolEntryTile> {
  late final AbilityPoolEntryViewModel _entryViewModel;

  @override
  void initState() {
    super.initState();
    _entryViewModel = AbilityPoolEntryViewModel(
      abilityPoolEntry: widget.abilityPoolEntry,
      pokemonRepo: widget.pokemonRepo,
      movePoolRepo: widget.movePoolRepo,
      abilityPoolRepo: widget.abilityPoolRepo,
      abilityRepo: widget.abilityRepo,
    );
    _entryViewModel.addListener(_onEntryChanged);
  }

  @override
  void dispose() {
    _entryViewModel.removeListener(_onEntryChanged);
    super.dispose();
  }

  void _onEntryChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_entryViewModel.abilityIsPresent && _entryViewModel.pokemonIsPresent) {
      debugPrint('Ability: ${_entryViewModel.formattedAbilityName}, Pokemon: ${_entryViewModel.formattedPokemonName}, Hidden: ${_entryViewModel.isHidden}');
      return AbilitypoolInfoCard(
        entryViewModel: _entryViewModel,
        abilityViewModel: _entryViewModel.abilityViewModel!,
        pokemonViewModel: _entryViewModel.pokemonViewModel!,
      );
    }

    return const ListTile(
      title: Text('Loading ability...'),
      subtitle: Text('Please wait...'),
    );
  }
}