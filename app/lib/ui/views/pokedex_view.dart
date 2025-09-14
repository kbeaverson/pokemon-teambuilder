import 'package:app/repository/pokemon_repo_powersync.dart';
import 'package:app/utils/pokemon_card_context.dart';
import 'package:flutter/material.dart';

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
  final PokemonCardContext _cardContext = FromPokedex();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _sortAscending = true;
  bool _showMega = false;
  bool _showMax = false;

  @override
  void initState() {
    super.initState();
    final pokemonRepo = PokemonRepoPowersync();
    _pokemonFuture = pokemonRepo.getAll();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final repo = Provider.of<PokemonRepo>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokédex',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            tooltip: _sortAscending ? 'Sort descending' : 'Sort ascending',
            onPressed: () {
              setState(() {
                _sortAscending = !_sortAscending;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filters',
            onPressed: () => _openFilterModal(context),
          ),
        ],
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No abilities found.'));
          }

          final pokedex = snapshot.data!;
          // create a mutable filtered+sorted list from the pokedex
          var filtered = List<Pokemon>.from(pokedex);
          // remove forms we don't want to show (Mega/Max forms) unless user enabled them
          filtered = filtered.where((p) {
            if (!_showMega && p.isMega) return false;
            if (!_showMax && p.isMax) return false;
            return true;
          }).toList();
          // Default sort: by isPreEvolution (final evolutions first), then dexNum
          filtered.sort((a, b) {
            final aPre = a.isPreEvolution ? 1 : 0;
            final bPre = b.isPreEvolution ? 1 : 0;
            var cmp = aPre.compareTo(bPre);
            if (cmp == 0) cmp = a.dexNum.compareTo(b.dexNum);
            return _sortAscending ? cmp : -cmp;
          });

          if (_searchQuery.isNotEmpty) {
            filtered = filtered
                .where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
                .toList();
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Pokémon',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => _searchController.clear(),
                          )
                        : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    debugPrint(filtered[index].toJson().toString());
                    final pokemon = PokemonViewModel(pokemon: filtered[index]);
                    return PokemonInfoCard(viewModel: pokemon, pokemonCardContext: _cardContext);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _openFilterModal(BuildContext context) {
    bool localShowMega = _showMega;
    bool localShowMax = _showMax;

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SwitchListTile(
                title: const Text('Show Mega forms'),
                value: localShowMega,
                onChanged: (v) {
                  localShowMega = v;
                  // rebuild sheet
                  (ctx as Element).markNeedsBuild();
                },
              ),
              SwitchListTile(
                title: const Text('Show Max forms'),
                value: localShowMax,
                onChanged: (v) {
                  localShowMax = v;
                  (ctx as Element).markNeedsBuild();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text('Reset'),
                    onPressed: () {
                      setState(() {
                        _showMega = false;
                        _showMax = false;
                      });
                      Navigator.pop(ctx);
                    },
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    child: const Text('Apply'),
                    onPressed: () {
                      setState(() {
                        _showMega = localShowMega;
                        _showMax = localShowMax;
                      });
                      Navigator.pop(ctx);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}