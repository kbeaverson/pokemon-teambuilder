import 'package:app/viewmodel/ability_viewmodel.dart';
import 'package:flutter/material.dart';

class AbilityInfoCard extends StatelessWidget {
  final AbilityViewModel viewModel;
  const AbilityInfoCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(viewModel.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8.0),
            Text(viewModel.description),
          ],
        ),
      ),
    );
  }
}