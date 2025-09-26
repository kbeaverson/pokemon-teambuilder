import 'package:app/utils/enums/learn_method.dart';
import 'package:app/viewmodel/move_pool_entry_viewmodel.dart';
import 'package:app/viewmodel/move_viewmodel.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';

class MovepoolInfoCard extends StatelessWidget {
  final MovePoolEntryViewModel movepoolEntryViewModel;
  final MoveViewModel moveViewModel;
  final PokemonViewModel pokemonViewModel;
  const MovepoolInfoCard({super.key, required this.movepoolEntryViewModel, required this.moveViewModel, required this.pokemonViewModel});

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
                                moveViewModel.type.iconSpritePath,
                                color: moveViewModel.typeColor,
                              ),
                            ),
                          ),
                          _buildMoveName(constraints, context),
                          if (movepoolEntryViewModel.learnMethod == LearnMethod.levelup) ...[
                            Padding(
                              padding: EdgeInsets.all(constraints.maxWidth * 0.005),
                              child: SizedBox(
                                width: constraints.maxWidth * 0.08,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Lv. ${movepoolEntryViewModel.levelupLevel}', 
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            // width: constraints.maxWidth * 0.09,
                            //   child: FittedBox(
                            //     fit: BoxFit.scaleDown,
                            //     child: Icon(
                            //       Icons.arrow_upward,
                            //       color: Theme.of(context).colorScheme.onSurfaceVariant,
                            //     ),
                            //   ),
                            // ),
                          ] else if (movepoolEntryViewModel.learnMethod == LearnMethod.egg) ...[
                            SizedBox(
                            width: constraints.maxWidth * 0.09,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                  movepoolEntryViewModel.learnMethodSpritePath!,
                                ),
                              ),
                            ),
                          ] else if (movepoolEntryViewModel.learnMethod == LearnMethod.tm) ...[
                            SizedBox(
                            width: constraints.maxWidth * 0.09,
                              child: Image.asset(
                                movepoolEntryViewModel.learnMethodSpritePath!,
                              ),
                            ),
                          ] else ...[
                            SizedBox(
                            width: constraints.maxWidth * 0.09,
                              child: Icon(
                                Icons.question_mark,
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                          SizedBox(width: constraints.maxWidth * 0.005,),
                          Padding(padding: const EdgeInsets.all(8.0),
                            child: _powerAccuracyPriorityRow(constraints, context),
                          ),
                        ],
                      ),
                      // Description
                      Padding(padding: const EdgeInsets.all(8.0),
                        child: Text(
                          moveViewModel.longDescription,
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
      width: constraints.maxWidth * 0.25, // Max 25% of screen width
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          moveViewModel.formattedName,
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
                moveViewModel.category.spritePath,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(width: constraints.maxWidth * 0.02,),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text('Power', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(moveViewModel.power > 0 ? moveViewModel.power.toString() : '\u2014'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text('Accuracy', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(moveViewModel.accuracy > 0 ? '${moveViewModel.accuracy}%' : '\u2014'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text('Priority', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(moveViewModel.priority > 0 ? moveViewModel.priority.toString() : '\u2014'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}