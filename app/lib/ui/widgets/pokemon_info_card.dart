import 'package:app/utils/pokemon_card_context.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';

class PokemonInfoCard extends StatelessWidget {
  final PokemonViewModel viewModel;
  final PokemonCardContext context;
  const PokemonInfoCard({super.key, required this.viewModel, required this.context});

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
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.2,
                            height: constraints.maxWidth * 0.2,
                            child: Image.asset(
                              viewModel.spritePath,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/pokemon_sprites/substitute.png');
                              },
                            ),
                          ),
                          Text(viewModel.name),
                          Spacer(),
                          _buildTypeBars(),
                        ],
                      ),
                      _buildStatCard(),
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

  Widget _buildStatCell(String label, int value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value.toString()),
      ],
    );
  }

  Widget _buildStatCard() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCell('HP', viewModel.baseHP),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 2.0)),
            _buildStatCell('Atk', viewModel.baseAtk),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 2.0)),
            _buildStatCell('Def', viewModel.baseDef),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 2.0)),
            _buildStatCell('SpA', viewModel.baseSpA),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 2.0)),
            _buildStatCell('SpD', viewModel.baseSpD),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 2.0)),
            _buildStatCell('Spe', viewModel.baseSpe),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0)),
            _buildStatCell('BST', viewModel.baseStatsTotal)
          ],
        ),
      ),
    );
  }

  Widget _buildTypeBars() {
    return Row(
      children: viewModel.type
          .map((type) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Image.asset(type.iconSpritePath, width: 60, color: Colors.grey[800])
              ))
          .toList(),
    );
  }
}