import 'package:app/ui/subviews/pokemon_abilitypool_view.dart';
import 'package:app/ui/subviews/pokemon_movepool_view.dart';
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
  Widget build(BuildContext context) {
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
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                            viewModel.primaryColor,
                            viewModel.secondaryColor,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 2, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.surfaceContainer,
                          ),
                          child: Image.asset(
                            viewModel.spritePath,
                            fit: BoxFit.contain,
                            errorBuilder: (c, e, s) => const Icon(Icons.broken_image, size: 72),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Name, types, and stats
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Types
                          Wrap(
                            spacing: 8,
                            children: viewModel.type.map((t) {
                              return Image.asset(
                                t.barSpritePath,
                                height: 20,
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) => const Icon(Icons.broken_image, size: 72),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Weight: ${viewModel.weight} kg',
                                style: TextStyle(
                                  fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight,
                                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                  color: Colors.white,
                                ),
                              ),
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
                          ? PokemonMovepoolView(viewModel: viewModel)
                          : Center(child: Text('Loading moves...')),
                    ),

                    // AbilityPool tab - placeholder list
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: viewModel.isAbilityPoolLoaded
                          ? PokemonAbilitypoolView(pokemonViewModel: viewModel)
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
          Text(
            label, 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
              color: Colors.white,
            )
          ),
          const SizedBox(height: 4),
          Text(
            value, 
            style: TextStyle(
              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              color: Colors.white,
            )
          ),
        ],
      ),
    );
  }
}