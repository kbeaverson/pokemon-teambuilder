import 'package:app/utils/pokemon_card_context.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';

class PokemonInfoCard extends StatelessWidget {
  final PokemonViewModel viewModel;
  final PokemonCardContext pokemonCardContext;
  const PokemonInfoCard({super.key, required this.viewModel, required this.pokemonCardContext});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [viewModel.primaryColor, viewModel.secondaryColor],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0), // Thickness of gradient border
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // Pokemon sprite - 18% of screen width
                          SizedBox(
                            width: constraints.maxWidth * 0.18,
                            child: Image.asset(
                              viewModel.spritePath,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/pokemon_sprites/substitute.png');
                              },
                            ),
                          ),
                          // Spacing
                          SizedBox(width: constraints.maxWidth * 0.02),
                          // Pokemon name - up to 40% of screen width with dynamic sizing
                          _buildPokemonName(context, constraints),
                          // Flexible spacer for remaining space
                          Expanded(child: SizedBox()),
                          // Type images - 10% of screen width total
                          _buildTypeBars(context, constraints),
                        ],
                      ),
                      _buildStatCard(context, constraints),
                    ],
                  ),
                ),
              ),
            ),
          ),
        onTap:() {
          // Handle tap
        },
      );
    });
  }

  Widget _buildPokemonName(BuildContext context, BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.4, // Max 40% of screen width
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          viewModel.name,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _buildStatCell(String label, int value, BuildContext context, double width) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(label, style: Theme.of(context).textTheme.labelLarge),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value.toString(), style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeBars(BuildContext context, BoxConstraints constraints) {
    // Each type image takes 10% of screen width
    double typeImageWidth = constraints.maxWidth * 0.1;
    
    return Row(
      children: viewModel.type
          .map((type) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: SizedBox(
                  width: typeImageWidth,
                  height: typeImageWidth,
                  child: Image.asset(
                    type.iconSpritePath, 
                    color: type.color,
                    fit: BoxFit.contain,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildStatCard(BuildContext context, BoxConstraints constraints) {
    // Each stat gets roughly 12% of screen width (7 stats = 84% total, leaving 16% for padding/spacing)
    double statWidth = constraints.maxWidth * 0.12;
    
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCell('HP', viewModel.baseHP, context, statWidth),
            _buildStatCell('Atk', viewModel.baseAtk, context, statWidth),
            _buildStatCell('Def', viewModel.baseDef, context, statWidth),
            _buildStatCell('SpA', viewModel.baseSpA, context, statWidth),
            _buildStatCell('SpD', viewModel.baseSpD, context, statWidth),
            _buildStatCell('Spe', viewModel.baseSpe, context, statWidth),
            _buildStatCell('BST', viewModel.baseStatsTotal, context, statWidth)
          ],
        ),
      ),
    );
  }
}