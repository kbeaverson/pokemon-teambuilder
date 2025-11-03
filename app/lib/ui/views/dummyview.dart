import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/static_models/pokemon_model.dart';

/// A basic view that reads PokemonRepo from the MultiProvider at the app route
/// and displays a simple list of pokemon (name and dex number).
class DummyView extends StatelessWidget {
  const DummyView({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<PokemonRepo>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Pokemon List'),
        automaticallyImplyLeading: true,
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: repo.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final pokes = snapshot.data ?? [];

          if (pokes.isEmpty) {
            return const Center(child: Text('No pokemon found'));
          }

          return ListView.separated(
            itemCount: pokes.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final p = pokes[i];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(p.dexNum.toString()),
                ),
                title: Text(p.name),
                subtitle: Text('ID: ${p.id}'),
                onTap: () => _showDetails(context, p),
              );
            },
          );
        },
      ),
    );
  }

  void _showDetails(BuildContext context, Pokemon p) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(p.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dex #: ${p.dexNum}'),
            const SizedBox(height: 8),
            Text('Types: ${p.type.map((t) => t.name).join(', ')}'),
            const SizedBox(height: 8),
            Text('Base HP: ${p.baseHP}'),
            Text('Base Atk: ${p.baseAtk}'),
            Text('Base Def: ${p.baseDef}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
