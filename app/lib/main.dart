import 'package:app/repository/ability_pool_repo_powersync.dart';
import 'package:app/repository/move_pool_repo_powersync.dart';
import 'package:app/repository/repo_contracts/ability_pool_repo.dart';
import 'package:app/repository/repo_contracts/move_pool_repo.dart';
import 'package:app/ui/views/splash_powersync_template.dart';
import 'package:app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/repository/repo_contracts/pokemon_repo.dart';
import 'package:app/repository/repo_contracts/item_repo.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/repository/repo_contracts/move_repo.dart';
import 'package:app/repository/pokemon_repo_powersync.dart';
import 'package:app/repository/item_repo_powersync.dart';
import 'package:app/repository/ability_repo_powersync.dart';
import 'package:app/repository/move_repo_powersync.dart';
import 'utils/powersync_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await openDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokemonRepo>(create: (_) => PokemonRepoPowersync()),
        Provider<ItemRepo>(create: (_) => ItemRepoPowersync()),
        Provider<AbilityRepo>(create: (_) => AbilityRepoPowersync()),
        Provider<MoveRepo>(create: (_) => MoveRepoPowersync()),
        Provider<MovePoolRepo>(create: (_) => MovePoolRepoPowersync()),
        Provider<AbilityPoolRepo>(create: (_) => AbilityPoolRepoPowersync()),
      ],
      child: MaterialApp(
        title: 'Powersync Demo',
        theme: pokemonLightTheme,
        darkTheme: pokemonDarkTheme,
        home: const SplashPage(),
      ),
    );
  }
}

