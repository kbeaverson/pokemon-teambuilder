import 'package:app/ui/views/splash_powersync_template.dart';
import 'package:app/utils/app_theme.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: pokemonLightTheme,
      darkTheme: pokemonDarkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Powersync Demo',
      theme: pokemonLightTheme,
      darkTheme: pokemonDarkTheme,
      home: const SplashPage(),
    );
  }
}
