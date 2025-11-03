// Repository providers are registered at app root in main.dart
import 'package:app/ui/views/abilitydex_view.dart';
import 'package:app/ui/views/itemdex_view.dart';
import 'package:app/ui/views/movedex_view.dart';
import 'package:app/ui/views/pokedex_view.dart';
import 'package:flutter/material.dart';
// Providers are available via Provider at the app root; no local imports needed here
// pokedex_view not used directly here

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teambuilder Home'),
        automaticallyImplyLeading: false,
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ItemdexView()),
                );
              },
              child: const Text('Itemdex'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AbilitydexView()),
                );
              },
              child: const Text('Abilitydex'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const MovedexView()),
                );
              },
              child: const Text('Movedex'),
            ),
          ],
        ),
      ),
    );
  }
}