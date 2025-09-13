import 'package:app/model/static_models/pokemon_model.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/ui/views/pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:app/utils/enums/pokemon_type.dart';

class FakePokemonRepo implements PokemonRepo {
  final List<Pokemon> _items;
  FakePokemonRepo(this._items);

  @override
  Future<List<Pokemon>> getAll() async => _items;

  @override
  Future<Pokemon?> getById(String id) async {
    try {
      return _items.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}

void main() {
  testWidgets('PokedexView shows pokemon from repo', (tester) async {
    final sample = Pokemon(
      id: '1',
      name: 'bulbasaur',
      dexNum: 1,
      type: [PokemonType.grass],
      isPreEvolution: false,
      weight: 6.9,
      genderRatio: 0.5,
      isMythical: false,
      isLegendary: false,
      isMax: false,
      isMega: false,
      mandatoryItemName: null,
      baseHP: 45,
      baseAtk: 49,
      baseDef: 49,
      baseSpA: 65,
      baseSpD: 65,
      baseSpe: 45,
    );

    await tester.pumpWidget(
      Provider<PokemonRepo>.value(
        value: FakePokemonRepo([sample]),
        child: const MaterialApp(home: PokedexView()),
      ),
    );

    // let future complete
    await tester.pumpAndSettle();

    // PokemonInfoCard displays the pokemon name
    expect(find.text('bulbasaur'), findsOneWidget);
  });

  testWidgets('PokedexView shows empty message when repo empty', (tester) async {
    await tester.pumpWidget(
      Provider<PokemonRepo>.value(
        value: FakePokemonRepo([]),
        child: const MaterialApp(home: PokedexView()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('No Pokémon found'), findsOneWidget);
  });
}
