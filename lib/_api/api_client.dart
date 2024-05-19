import 'dart:convert';
import 'package:http/http.dart' as http;
import '../_models/pokemon.dart';

class PokemonApiClient {
  Future<List<Pokemon>> fetchPokemonData() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20&offset=0'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;
      return results.map((pokemon) => Pokemon(
        name: pokemon['name'],
        url: pokemon['url'],
      )).toList();
    } else {
      throw Exception('Failed to load Pokemon data');
    }
  }
}

