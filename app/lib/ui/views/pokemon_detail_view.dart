import 'package:app/repository/ability_pool_repo_powersync.dart';
import 'package:app/repository/move_pool_repo_powersync.dart';
import 'package:app/repository/move_repo_powersync.dart';
import 'package:app/repository/pokemon_repo_powersync.dart';
import 'package:app/ui/widgets/movepool_info_card.dart';
import 'package:app/viewmodel/move_pool_entry_viewmodel.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';

class PokemonDetailView extends StatefulWidget {
  final PokemonViewModel viewModel;

  const PokemonDetailView({super.key, required this.viewModel});

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  PokemonViewModel get viewModel => widget.viewModel;
  @override
  void initState() {
    // Listen to changes from the viewModel so that the UI rebuilds
    // when the move/ability pools are loaded asynchronously.
    viewModel.addListener(_onViewModelChanged);
    super.initState();

    // Trigger loads after listener is attached so notifications are observed.
    viewModel.loadMovePool();
    viewModel.loadAbilityPool();
  }

  @override
  void dispose() {
    viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  void _onViewModelChanged() {
    // Rebuild when the view model notifies listeners.
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Repositories needed for MovePoolEntryViewModel
    final moveRepo = MoveRepoPowersync();
    final pokemonRepo = PokemonRepoPowersync();
    final movePoolRepo = MovePoolRepoPowersync();
    final abilityPoolRepo = AbilityPoolRepoPowersync();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.formattedName),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sprite
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        viewModel.spritePath,
                        fit: BoxFit.contain,
                        errorBuilder: (c, e, s) => const Icon(Icons.broken_image, size: 72),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Name, types, and stats
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Types
                          Wrap(
                            spacing: 8,
                            children: viewModel.type.map((t) {
                              return Chip(
                                label: Text(t.name.toUpperCase()),
                                backgroundColor: t.color,
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 8),
                          // Basic stats summary
                          Row(
                            children: [
                              _StatColumn(label: 'HP', value: viewModel.baseHP.toString()),
                              _StatColumn(label: 'ATK', value: viewModel.baseAtk.toString()),
                              _StatColumn(label: 'DEF', value: viewModel.baseDef.toString()),
                              _StatColumn(label: 'SPA', value: viewModel.baseSpA.toString()),
                              _StatColumn(label: 'SPD', value: viewModel.baseSpD.toString()),
                              _StatColumn(label: 'SPE', value: viewModel.baseSpe.toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // weight and evo info
                          Row(
                            children: [
                              Text('Weight: ${viewModel.weight} kg'),
                              const SizedBox(width: 12),
                              if (viewModel.isPreEvolution) const Chip(label: Text('Pre-evolution')),
                              if (viewModel.prevoId != null) const SizedBox.shrink(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'MovePool'),
                  Tab(text: 'AbilityPool'),
                  Tab(text: 'Damage'),
                ],
              ),
              // Tab contents
              SizedBox(
                height: 520, // allow the TabBarView to have space inside scroll view
                child: TabBarView(
                  children: [
                    // MovePool tab - placeholder list
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: viewModel.isMovePoolLoaded
                          ? ListView.builder(
                              itemCount: viewModel.movePool.length,
                              itemBuilder: (context, index) {
                                  // Use a small stateful tile so the MovePoolEntryViewModel is created once per
                                  // list item and can notify the tile to rebuild when its async loads complete.
                                  return _MovePoolEntryTile(
                                    movePoolEntry: viewModel.movePool[index],
                                    moveRepo: moveRepo,
                                    pokemonRepo: pokemonRepo,
                                    movePoolRepo: movePoolRepo,
                                    abilityPoolRepo: abilityPoolRepo,
                                  );
                                },
                            )
                          : Center(child: Text('Loading moves...')),
                    ),

                    // AbilityPool tab - placeholder list
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: viewModel.isAbilityPoolLoaded
                          ? ListView.builder(
                              itemCount: viewModel.abilityPool.length,
                              itemBuilder: (context, index) {
                                final entry = viewModel.abilityPool[index];
                                return ListTile(
                                  title: Text(entry.abilityId ?? 'Unknown Ability'),
                                  subtitle: Text(entry.isHidden ? 'Hidden Ability' : 'Standard Ability'),
                                );
                              },
                            )
                          : Center(child: Text('Loading abilities...')),
                    ),

                    // Damage chart tab - placeholder
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Damage relationships for ${viewModel.formattedName}', style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 12),
                          // Placeholder grid showing types and dummy multipliers
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: 3,
                              children: viewModel.type.map((t) {
                                return Card(
                                  color: t.color,
                                  child: Center(child: Text('${t.name.toUpperCase()} x1')),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Small helper widget used for stats in a row
class _StatColumn extends StatelessWidget {
  final String label;
  final String value;

  const _StatColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

// Helper tile that owns a MovePoolEntryViewModel for a single list item and rebuilds
// when the ViewModel finishes loading related data.
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