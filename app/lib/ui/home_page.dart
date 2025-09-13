import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repository/pokemon_repo_powersync.dart';
import '../repository/item_repo_powersync.dart';
import '../repository/ability_repo_powersync.dart';
import '../repository/move_repo_powersync.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PokemonRepoPowersync()),
        Provider(create: (_) => ItemRepoPowersync()),
        Provider(create: (_) => AbilityRepoPowersync()),
        Provider(create: (_) => MoveRepoPowersync()),
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
                  // TODO: Navigate to Pokedex
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
                  // TODO: Navigate to Abilitydex
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