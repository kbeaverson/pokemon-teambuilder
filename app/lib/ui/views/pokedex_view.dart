import 'package:app/repository/pokemon_repo_powersync.dart';
import 'package:app/utils/pokemon_card_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:app/ui/widgets/pokemon_info_card.dart';
import 'package:app/model/static_models/pokemon_model.dart';

/// PokedexView
///
/// Queries the provided [PokemonRepo] (supplied by the Home page via Provider)
/// for all Pokemon and displays each as a [PokemonInfoCard] wrapped in a
/// [PokemonViewModel] using the [FromPokedex] context.
class PokedexView extends StatefulWidget {
  const PokedexView({super.key});

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  late Future<List<Pokemon>> _pokemonFuture;
  final Map<int, PokemonViewModel> _viewModelCache = {};
  final PokemonCardContext _cardContext = FromPokedex();

  @override
  void initState() {
    super.initState();
    final pokemonRepo = PokemonRepoPowersync();
    _pokemonFuture = pokemonRepo.getAll();
  }

  @override
  Widget build(BuildContext context) {
    //final repo = Provider.of<PokemonRepo>(context, listen: false);
    final pokemonRepo = PokemonRepoPowersync();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: pokemonRepo.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No abilities found.'));
          }

          final pokedex = snapshot.data!;
          // Sort Pokémon alphabetically by name
          pokedex.sort((a, b) => a.name.compareTo(b.name));
          return ListView.builder(
            itemCount: pokedex.length,
            itemBuilder: (context, index) {
              debugPrint(pokedex[index].toJson().toString());
              final pokemon = PokemonViewModel(pokemon: pokedex[index]);
              final PokemonCardContext cardContext = FromPokedex();
              return PokemonInfoCard(viewModel: pokemon, context: cardContext);
            },
          );
        },
      ),
    );
  }
}