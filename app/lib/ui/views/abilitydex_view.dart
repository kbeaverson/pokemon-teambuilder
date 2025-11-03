import 'package:app/model/static_models/ability_model.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:provider/provider.dart';
import 'package:app/ui/widgets/ability_info_card.dart';
import 'package:app/utils/ability_card_context.dart';
import 'package:app/viewmodel/ability_viewmodel.dart';
import 'package:flutter/material.dart';

class AbilitydexView extends StatefulWidget {
  const AbilitydexView({super.key});

  @override
  State<AbilitydexView> createState() => _AbilitydexViewState();
}

class _AbilitydexViewState extends State<AbilitydexView> {
  late Future<List<Ability>> _abilitiesFuture;
  final AbilityCardContext _cardContext = FromAbilitydex();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    final abilityRepo = Provider.of<AbilityRepo>(context, listen: false);
    _abilitiesFuture = abilityRepo.getAll();
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
        title: const Text('Abilitydex'),
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
      body: FutureBuilder<List<Ability>>(
        future: _abilitiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No abilities found.'));
          }

          List<Ability> abilities = snapshot.data!;
          if (_searchQuery.isNotEmpty) {
            abilities = abilities
                .where((ability) => ability.name.toLowerCase().contains(_searchQuery.toLowerCase()))
                .toList();
          }
          abilities.sort((a, b) => _sortAscending
              ? a.name.compareTo(b.name)
              : b.name.compareTo(a.name));

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Abilities',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                    prefixIcon: const Icon(Icons.search),
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
                  itemCount: abilities.length,
                  itemBuilder: (context, index) {
                    final ability = AbilityViewModel(ability: abilities[index]);
                    return AbilityInfoCard(viewModel: ability, abilityCardContext: _cardContext);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}