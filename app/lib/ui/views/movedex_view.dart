import 'package:app/model/static_models/move_model.dart';
import 'package:app/repository/move_repo_powersync.dart';
import 'package:app/ui/widgets/move_info_card.dart';
import 'package:app/utils/move_card_context.dart';
import 'package:app/viewmodel/move_viewmodel.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    final moveRepo = MoveRepoPowersync();
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
            List<Move> moves = snapshot.data!;
            if (_searchQuery.isNotEmpty) {
              moves = moves.where((move) => move.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
            }
            moves.sort((a, b) => _sortAscending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
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
                    itemCount: moves.length,
                    itemBuilder: (context, index) {
                      final move = moves[index];
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
}