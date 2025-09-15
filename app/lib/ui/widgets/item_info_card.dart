import 'package:app/utils/item_card_context.dart';
import 'package:app/viewmodel/item_viewmodel.dart';
import 'package:flutter/material.dart';

class ItemInfoCard extends StatelessWidget {
  final ItemViewModel viewModel;
  final ItemCardContext itemCardContext;
  const ItemInfoCard({super.key, required this.viewModel, required this.itemCardContext});

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
                color: Theme.of(context).colorScheme.outline,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0), // Thickness of gradient border
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                            children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.18,
                              child: ClipRect(
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: 1.4, // Increase to zoom in horizontally
                                  heightFactor: 1.4, // Increase to zoom in vertically
                                  child: Image.asset(
                                    viewModel.spritePath,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      debugPrint('Error loading image for ${viewModel.name.toLowerCase().replaceAll(' ', '-')}');
                                      return Image.asset('assets/pokemon_sprites/substitute.png');
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              viewModel.name,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(4.0),
                        child: Text(
                          viewModel.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        onTap:() {
          // Handle tap
          // If context is FromAbilitydex, open detailed view
          // If context is FromTeamBuilder, select this Ability and close the modal
        },
      );
    });
  }
}