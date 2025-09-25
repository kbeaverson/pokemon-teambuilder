import 'package:app/utils/move_card_context.dart';
import 'package:app/viewmodel/move_viewmodel.dart';
import 'package:flutter/material.dart';

class MoveInfoCard extends StatelessWidget {
  final MoveViewModel viewModel;
  final MoveCardContext moveCardContext;
  const MoveInfoCard({super.key, required this.viewModel, required this.moveCardContext});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.outline,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Type icon, move name, category icon, power, accuracy, priority
                      Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.09,
                            child: Padding(padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                viewModel.type.iconSpritePath,
                                color: viewModel.typeColor,
                              ),
                            ),
                          ),
                          _buildMoveName(constraints, context),
                          Spacer(),
                          Padding(padding: const EdgeInsets.all(8.0),
                            child: _powerAccuracyPriorityRow(constraints, context),
                          ),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.all(8.0),
                        child: Text(
                          viewModel.longDescription,
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
        );
    });
  }

  Widget _buildMoveName(BoxConstraints constraints, BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth * 0.35, // Max 35% of screen width
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          viewModel.formattedName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _powerAccuracyPriorityRow(BoxConstraints constraints, BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth * 0.45, // Max 45% of screen width
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.09,
              child: Image.asset(
                viewModel.category.spritePath,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(width: constraints.maxWidth * 0.02,),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text('Power', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(viewModel.power > 0 ? viewModel.power.toString() : '\u2014'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text('Accuracy', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(viewModel.accuracy > 0 ? '${viewModel.accuracy}%' : '\u2014'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text('Priority', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(viewModel.priority > 0 ? viewModel.priority.toString() : '\u2014'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}