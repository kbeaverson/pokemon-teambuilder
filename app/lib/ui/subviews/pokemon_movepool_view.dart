import 'package:app/repository/ability_pool_repo_powersync.dart';
import 'package:app/repository/move_pool_repo_powersync.dart';
import 'package:app/repository/move_repo_powersync.dart';
import 'package:app/repository/pokemon_repo_powersync.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/ui/widgets/movepool_info_card.dart';
import 'package:app/viewmodel/move_pool_entry_viewmodel.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonMovepoolView extends StatefulWidget {
  final PokemonViewModel viewModel;
  const PokemonMovepoolView({super.key, required this.viewModel});

  @override
  State<PokemonMovepoolView> createState() => _PokemonMovepoolViewState();
}

class _PokemonMovepoolViewState extends State<PokemonMovepoolView> {
  late PokemonRepo _pokemonRepo;
  late MoveRepo _moveRepo;
  late MovePoolRepo _movePoolRepo;
  late AbilityPoolRepo _abilityPoolRepo;
  PokemonViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.addListener(_onViewModelChanged);
    viewModel.loadMovePool();
    _pokemonRepo = Provider.of<PokemonRepo>(context, listen: false);
    _moveRepo = Provider.of<MoveRepo>(context, listen: false);
    _movePoolRepo = Provider.of<MovePoolRepo>(context, listen: false);
    _abilityPoolRepo = Provider.of<AbilityPoolRepo>(context, listen: false);
  }

  @override
  void dispose() {
    viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  void _onViewModelChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.movePool.length,
      itemBuilder: (context, index) {
        final entry = viewModel.movePool[index];
        return _MovePoolEntryTile(
          movePoolEntry: entry,
          moveRepo: _moveRepo,
          pokemonRepo: _pokemonRepo,
          movePoolRepo: _movePoolRepo,
          abilityPoolRepo: _abilityPoolRepo,
        );
      },
    );
  }
}

class _MovePoolEntryTile extends StatefulWidget {
  final dynamic movePoolEntry;
  final dynamic moveRepo;
  final dynamic pokemonRepo;
  final dynamic movePoolRepo;
  final dynamic abilityPoolRepo;

  const _MovePoolEntryTile({
    required this.movePoolEntry,
    required this.moveRepo,
    required this.pokemonRepo,
    required this.movePoolRepo,
    required this.abilityPoolRepo,
  });

  @override
  State<_MovePoolEntryTile> createState() => _MovePoolEntryTileState();
}

class _MovePoolEntryTileState extends State<_MovePoolEntryTile> {
  late final MovePoolEntryViewModel _entryViewModel;

  @override
  void initState() {
    super.initState();
    _entryViewModel = MovePoolEntryViewModel(
      movePoolEntry: widget.movePoolEntry,
      moveRepo: widget.moveRepo,
      pokemonRepo: widget.pokemonRepo,
      movePoolRepo: widget.movePoolRepo,
      abilityPoolRepo: widget.abilityPoolRepo,
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
    if (_entryViewModel.moveIsPresent && _entryViewModel.pokemonIsPresent) {
      debugPrint('Move: ${_entryViewModel.moveViewModel!.name}, Pokemon: ${_entryViewModel.pokemonViewModel!.name}');
      return MovepoolInfoCard(movepoolEntryViewModel: _entryViewModel, moveViewModel: _entryViewModel.moveViewModel!, pokemonViewModel: _entryViewModel.pokemonViewModel!);
    }

    return const ListTile(
      title: Text('Loading move...'),
      subtitle: Text('Please wait'),
    );
  }
}