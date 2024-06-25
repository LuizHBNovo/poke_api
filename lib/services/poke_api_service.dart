import 'package:dio/dio.dart';
import '../models/pokemon.dart';

class PokeApiService {
  final Dio _dio = Dio();

  Future<Pokemon> fetchPokemonById(int id) async {
    try {
      Response response =
          await _dio.get('https://pokeapi.co/api/v2/pokemon/$id');
      return Pokemon.fromJson(response.data);
    } catch (e) {
      print('Error fetching Pokémon data: $e');
      throw e;
    }
  }

  Future<Pokemon> fetchPokemonByName(String name) async {
    try {
      Response response =
          await _dio.get('https://pokeapi.co/api/v2/pokemon/$name');
      return Pokemon.fromJson(response.data);
    } catch (e) {
      print('Error fetching Pokémon data: $e');
      throw e;
    }
  }

  Future<List<Pokemon>> fetchPokemonList() async {
    try {
      Response response = await _dio.get(
          'https://pokeapi.co/api/v2/pokemon?limit=100'); // Limite de 100 Pokémon para exemplo
      List<dynamic> results = response.data['results'];
      List<Pokemon> pokemons = [];

      for (var result in results) {
        Response pokemonResponse = await _dio.get(result['url']);
        pokemons.add(Pokemon.fromJson(pokemonResponse.data));
      }

      return pokemons;
    } catch (e) {
      print('Error fetching Pokémon list: $e');
      throw e;
    }
  }
}
