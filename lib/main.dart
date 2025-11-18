import 'package:flutter/material.dart';
import 'package:my_flutter_pokedex/features/pokemon_list/presentation/pages/pokemon_list_page.dart';
import 'package:my_flutter_pokedex/core/utils/injections.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PokemonListPage(),
    );
  }
}