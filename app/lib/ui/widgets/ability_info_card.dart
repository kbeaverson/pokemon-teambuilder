import 'package:app/utils/ability_card_context.dart';
import 'package:app/viewmodel/ability_viewmodel.dart';
import 'package:flutter/material.dart';

class AbilityInfoCard extends StatelessWidget {
  final AbilityViewModel viewModel;
  final AbilityCardContext abilityCardContext;
  const AbilityInfoCard({super.key, required this.viewModel, required this.abilityCardContext});

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
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          viewModel.name,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
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
        );
    });
  }
}