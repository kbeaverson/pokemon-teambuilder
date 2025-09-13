import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/repository/repo_contracts/item_repo.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/ui/views/chat_page_ph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repository/repo_contracts/pokemon_repo.dart';
import '../../repository/pokemon_repo_powersync.dart';
import '../../repository/item_repo_powersync.dart';
import '../../repository/ability_repo_powersync.dart';
import '../../repository/move_repo_powersync.dart';
import 'pokedex_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokemonRepo>(create: (_) => PokemonRepoPowersync()),
        Provider<ItemRepo>(create: (_) => ItemRepoPowersync()),
        Provider<AbilityRepo>(create: (_) => AbilityRepoPowersync()),
        Provider<MoveRepo>(create: (_) => MoveRepoPowersync()),
        // Add more repositories here as needed
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Teambuilder Home'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout') {
                  // TODO: Implement logout logic
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PokedexView()),
                  );
                },
                child: const Text('Pokedex'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to Itemdex
                },
                child: const Text('Itemdex'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ChatPage()),
                  );
                },
                child: const Text('Abilitydex'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to Movedex
                },
                child: const Text('Movedex'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}