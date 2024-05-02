import 'package:flutter/material.dart';
import '../_api/ApiClient.dart';
import '../_models/pokemon.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: PokemonApiClient().fetchPokemonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
              backgroundColor: Colors.green,
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          final pokemons = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
              backgroundColor: Colors.green,
            ),
            body: ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return ListTile(
                  title: Text(pokemon.name),
                  subtitle: Text(pokemon.url),
                );
              },
            ),
          );
        }
      },
    );
  }
}

