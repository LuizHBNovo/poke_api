import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/poke_api_service.dart';

class PokemonListViewModel with ChangeNotifier {
  final PokeApiService _pokeApiService = PokeApiService();
  List<Pokemon> _pokemons = [];
  bool _isLoading = false;

  List<Pokemon> get pokemons => _pokemons;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemonList() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _pokeApiService.fetchPokemonList();
      _pokemons = data;
    } catch (e) {
      print('Error fetching Pokémon list: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
