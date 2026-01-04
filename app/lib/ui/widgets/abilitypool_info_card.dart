import 'package:app/viewmodel/ability_pool_entry_viewmodel.dart';
import 'package:app/viewmodel/ability_viewmodel.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';

/// A card displaying information about an Ability within the context of a Pokemon's ability pool.
class AbilitypoolInfoCard extends StatelessWidget {
  final AbilityPoolEntryViewModel _entryViewModel;
  final AbilityViewModel _abilityViewModel;
  final PokemonViewModel _pokemonViewModel;
  const AbilitypoolInfoCard({
    Key? key,
    required AbilityPoolEntryViewModel entryViewModel,
    required AbilityViewModel abilityViewModel,
    required PokemonViewModel pokemonViewModel,
  })  : _entryViewModel = entryViewModel,
        _abilityViewModel = abilityViewModel,
        _pokemonViewModel = pokemonViewModel,
        super(key: key);

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
                      // Ability name, hidden status
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Text(
                            _abilityViewModel.formattedName,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: constraints.maxWidth * 0.09,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Image.asset(
                                _entryViewModel.spritePath,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Description
                      Padding(padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _abilityViewModel.description,
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