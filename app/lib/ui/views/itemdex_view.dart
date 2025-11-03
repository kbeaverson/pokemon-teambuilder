import 'package:app/model/static_models/item_model.dart';
import 'package:app/repository/item_repo_powersync.dart';
import 'package:app/repository/repo_contracts/item_repo.dart';
import 'package:app/ui/widgets/item_info_card.dart';
import 'package:app/utils/item_card_context.dart';
import 'package:app/viewmodel/item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemdexView extends StatefulWidget {
  const ItemdexView({super.key});

  @override
  State<ItemdexView> createState() => _ItemdexViewState();
}

class _ItemdexViewState extends State<ItemdexView> {
  late Future<List<Item>> _itemsFuture;
  final ItemCardContext _itemCardContext = FromItemdex();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    final itemRepo = Provider.of<ItemRepo>(context, listen: false);
    _itemsFuture = itemRepo.getAll();
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
        title: const Text('Itemdex'),
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
      body: FutureBuilder<List<Item>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No items found.'));
          } else {
            List<Item> items = snapshot.data!;
            if (_searchQuery.isNotEmpty) {
              items = items.where((item) => item.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
            }
            items.sort((a, b) => _sortAscending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Items',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
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
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      // Assuming ItemViewModel and ItemInfoCard are defined elsewhere
                      final itemViewModel = ItemViewModel(item: item);
                      return ItemInfoCard(viewModel: itemViewModel, itemCardContext: _itemCardContext);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}