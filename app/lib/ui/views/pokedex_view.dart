import 'package:app/repository/ability_pool_repo_powersync.dart';
import 'package:app/repository/move_pool_repo_powersync.dart';
import 'package:app/repository/pokemon_repo_powersync.dart';
import 'package:app/utils/pokemon_card_context.dart';
import 'package:flutter/material.dart';

import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/viewmodel/pokemon_viewmodel.dart';
import 'package:app/ui/widgets/pokemon_info_card.dart';
import 'package:app/model/static_models/pokemon_model.dart';
import 'package:provider/provider.dart';

enum PokedexSortOption { preThenDex, dexThenPre, formThenPreThenDex, name }

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
  PokedexSortOption _sortOption = PokedexSortOption.preThenDex;

  @override
  void initState() {
    super.initState();
    final pokemonRepo = Provider.of<PokemonRepo>(context, listen: false);
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
            icon: const Icon(Icons.swap_vert),
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
            return const Center(child: Text('No pokemon found.'));
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
          // Sorting based on user-selected option
          filtered.sort((a, b) {
            int cmp = 0;
            switch (_sortOption) {
              case PokedexSortOption.preThenDex:
                final aPre = a.isPreEvolution ? 1 : 0;
                final bPre = b.isPreEvolution ? 1 : 0;
                cmp = aPre.compareTo(bPre);
                if (cmp == 0) cmp = a.dexNum.compareTo(b.dexNum);
                break;
              case PokedexSortOption.dexThenPre:
                cmp = a.dexNum.compareTo(b.dexNum);
                if (cmp == 0) {
                  final aPre = a.isPreEvolution ? 1 : 0;
                  final bPre = b.isPreEvolution ? 1 : 0;
                  cmp = aPre.compareTo(bPre);
                }
                break;
              case PokedexSortOption.formThenPreThenDex:
                // group by form: neither (0) -> mega (1) -> max (2)
                int aForm = 0;
                int bForm = 0;
                if (a.isMega) aForm = 1;
                if (a.isMax) aForm = 2;
                if (b.isMega) bForm = 1;
                if (b.isMax) bForm = 2;
                cmp = aForm.compareTo(bForm);
                if (cmp == 0) {
                  final aPre = a.isPreEvolution ? 1 : 0;
                  final bPre = b.isPreEvolution ? 1 : 0;
                  cmp = aPre.compareTo(bPre);
                  if (cmp == 0) cmp = a.dexNum.compareTo(b.dexNum);
                }
                break;
              case PokedexSortOption.name:
                cmp = a.name.toLowerCase().compareTo(b.name.toLowerCase());
                break;
            }
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
                    final pokemon = PokemonViewModel(pokemon: filtered[index], pokemonRepo: PokemonRepoPowersync(), movePoolRepo: MovePoolRepoPowersync(), abilityPoolRepo: AbilityPoolRepoPowersync());
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
    PokedexSortOption localSortOption = _sortOption;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = MediaQuery.of(context).size.height * 0.9;
            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: StatefulBuilder(
                builder: (context, setModalState) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 16.0,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Filters & Sort', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const Text('Forms', style: TextStyle(fontWeight: FontWeight.w600)),
                          SwitchListTile(
                            title: const Text('Show Mega forms'),
                            value: localShowMega,
                            onChanged: (v) {
                              localShowMega = v;
                              setModalState(() {});
                            },
                          ),
                          SwitchListTile(
                            title: const Text('Show Max forms'),
                            value: localShowMax,
                            onChanged: (v) {
                              localShowMax = v;
                              setModalState(() {});
                            },
                          ),
                          const SizedBox(height: 8),
                          const Text('Sort by', style: TextStyle(fontWeight: FontWeight.w600)),
                          RadioListTile<PokedexSortOption>(
                            title: const Text('Pre-evolution then Dex'),
                            value: PokedexSortOption.preThenDex,
                            groupValue: localSortOption,
                            onChanged: (v) {
                              if (v == null) return;
                              localSortOption = v;
                              setModalState(() {});
                            },
                          ),
                          RadioListTile<PokedexSortOption>(
                            title: const Text('Dex then Pre-evolution'),
                            value: PokedexSortOption.dexThenPre,
                            groupValue: localSortOption,
                            onChanged: (v) {
                              if (v == null) return;
                              localSortOption = v;
                              setModalState(() {});
                            },
                          ),
                          RadioListTile<PokedexSortOption>(
                            title: const Text('Form → Pre → Dex (neither, mega, max)'),
                            value: PokedexSortOption.formThenPreThenDex,
                            groupValue: localSortOption,
                            onChanged: (v) {
                              if (v == null) return;
                              localSortOption = v;
                              setModalState(() {});
                            },
                          ),
                          RadioListTile<PokedexSortOption>(
                            title: const Text('Name (A–Z)'),
                            value: PokedexSortOption.name,
                            groupValue: localSortOption,
                            onChanged: (v) {
                              if (v == null) return;
                              localSortOption = v;
                              setModalState(() {});
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
                                    _sortOption = localSortOption;
                                  });
                                  Navigator.pop(ctx);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}