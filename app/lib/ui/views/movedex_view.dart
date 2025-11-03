import 'package:app/model/static_models/move_model.dart';
import 'package:app/repository/move_repo_powersync.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/ui/widgets/move_info_card.dart';
import 'package:app/utils/enums/move_category.dart';
import 'package:app/utils/enums/pokemon_type.dart';
import 'package:app/utils/move_card_context.dart';
import 'package:app/utils/string_extension.dart';
import 'package:app/viewmodel/move_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovedexView extends StatefulWidget {
  const MovedexView({super.key});

  @override
  State<MovedexView> createState() => _MovedexViewState();
}

class _MovedexViewState extends State<MovedexView> {
  late Future<List<Move>> _movesFuture;
  final MoveCardContext _cardContext = FromMoveDex();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _sortAscending = true;
  bool _showMax = false;
  bool _showZ = false;
  // Selected move types to filter by. Empty = no type filtering (show all types).
  final Set<PokemonType> _selectedTypes = <PokemonType>{};
  // Selected move categories to filter by. Empty = no category filtering (show all categories).
  final Set<MoveCategory> _selectedCategories = <MoveCategory>{};

  @override
  void initState() {
    super.initState();
    final moveRepo = Provider.of<MoveRepo>(context, listen: false);
    _movesFuture = moveRepo.getAll();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movedex'),
        actions: [
          IconButton(
            icon: Icon(_sortAscending ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: () {
              setState(() {
                _sortAscending = !_sortAscending;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _openFilterModal(context),
          ),
        ],
      ),
      body: FutureBuilder<List<Move>>(
        future: _movesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No moves found.'));
          } else {
            final movedex = snapshot.data!;
            var filtered = List<Move>.from(movedex);
            filtered = filtered.where((m) {
              if (!_showMax && m.isMaxMove) return false;
              if (!_showZ && m.isZmove) return false;
              // If type filters are selected, exclude moves whose type is not in the set.
              if (_selectedTypes.isNotEmpty && !_selectedTypes.contains(m.type)) {
                return false;
              }
              // If category filters are selected, exclude moves whose category is not in the set.
              if (_selectedCategories.isNotEmpty && !_selectedCategories.contains(m.category)) {
                return false;
              }
              return true;
            }).toList();

            if (_searchQuery.isNotEmpty) {
              filtered = filtered.where((move) => move.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
            }
            filtered.sort((a, b) => _sortAscending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Moves',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                              },
                            )
                          : null,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final move = filtered[index];
                      // Convert Move to MoveViewModel
                      final moveViewModel = MoveViewModel(move: move);
                      return MoveInfoCard(viewModel: moveViewModel, moveCardContext: _cardContext);
                    },
                  ),
                ),
              ],
            );
          }
        },
      )
    );
  }

  void _openFilterModal(BuildContext context) {
    bool localShowMax = _showMax;
    bool localShowZ = _showZ;
    // Make a local copy of the selected types so modal can be cancelled
    final Set<PokemonType> localSelectedTypes = Set<PokemonType>.from(_selectedTypes);
    // Make a local copy of the selected categories so modal can be cancelled
    final Set<MoveCategory> localSelectedCategories = Set<MoveCategory>.from(_selectedCategories);

    showModalBottomSheet<void>(
      context: context, 
      builder: (BuildContext ctx) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight * 0.9;
            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: StatefulBuilder(
                builder: (context, setModalState) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with title and action buttons
                          Row(
                            children: [
                              Text('Filter Options', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                              Spacer(),
                              // Action Buttons
                              ElevatedButton(
                                child: const Text('Reset'),
                                onPressed: () {
                                  localShowMax = false;
                                  localShowZ = false;
                                  setState(() {
                                    _showMax = localShowMax;
                                    _showZ = localShowZ;
                                    // apply type selections
                                    _selectedTypes.clear();
                                    _selectedCategories.clear();
                                  });
                                  Navigator.pop(ctx);
                                },
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                child: const Text('Apply'),
                                onPressed: () {
                                  setState(() {
                                    _showMax = localShowMax;
                                    _showZ = localShowZ;
                                    // apply type selections
                                    _selectedTypes.clear();
                                    _selectedTypes.addAll(localSelectedTypes);
                                    _selectedCategories.clear();
                                    _selectedCategories.addAll(localSelectedCategories);
                                  });
                                  Navigator.pop(ctx);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text('Filter by Categories', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          // Category buttons: present as a compact grid of chips
                          GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 96 / 36,
                            children: MoveCategory.values.where((category) => category != MoveCategory.error,).map((category) {
                              final active = localSelectedCategories.contains(category);
                              return SizedBox(
                                width: 96,
                                height: 36,
                                child: ChoiceChip(
                                  label: SizedBox(
                                    width: constraints.maxWidth * 0.25,
                                    child: Text(
                                      category.name.toTitleCase(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  showCheckmark: false,
                                  selected: active,
                                  onSelected: (sel) {
                                    if (sel) {
                                      localSelectedCategories.add(category);
                                    } else {
                                      localSelectedCategories.remove(category);
                                    }
                                    setModalState(() {});
                                  },
                                  avatar: active ? Image.asset(
                                    category.spritePath,
                                    color: Colors.white,
                                    width: 24,
                                    height: 24,
                                  ) : null,
                                  selectedColor: Theme.of(context).colorScheme.secondary,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 8),
                          Text('Filter by Types', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          // Type buttons: present as a compact grid of chips
                          GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 96 / 36,
                            children: PokemonType.values.where((type) => type != PokemonType.typeless && type != PokemonType.stellar).map((type) {
                              final active = localSelectedTypes.contains(type);
                              return SizedBox(
                                width: 96,
                                height: 36,
                                child: ChoiceChip(
                                  label: SizedBox(
                                    width: constraints.maxWidth * 0.25,
                                    child: Text(
                                      type.name.toTitleCase(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  avatar: active ? Image.asset(
                                    type.iconSpritePath,
                                    color: Colors.white,
                                    width: 24,
                                    height: 24,
                                  ) : null,
                                  showCheckmark: false,
                                  selected: active,
                                  onSelected: (sel) {
                                    if (sel) {
                                      localSelectedTypes.add(type);
                                    } else {
                                      localSelectedTypes.remove(type);
                                    }
                                    setModalState(() {});
                                  },
                                  selectedColor: type.color,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 8),
                          // Gimmick moves toggles
                          Text('Toggle Gimmick Moves', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
                          SwitchListTile(
                            title: const Text('Max Moves'),
                            value: localShowMax,
                            onChanged: (value) {
                              localShowMax = value;
                              setModalState(() {});
                            }
                          ),
                          SwitchListTile(
                            title: const Text('Z Moves'),
                            value: localShowZ,
                            onChanged: (value) {
                              localShowZ = value;
                              setModalState(() {});
                            }
                          ),
                          SizedBox(height: 16,),
                        ],
                      ),
                    ),
                  );
                }
              ),
            );
          }
        );
      }
    );
  }
}