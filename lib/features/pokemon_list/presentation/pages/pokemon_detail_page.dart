import 'package:flutter/material.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PokemonDetailPage();
}

class _PokemonDetailPage extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Pokemon Detail Page"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text("Pokemon Detail Page"),
      ),
    );
  }
}
