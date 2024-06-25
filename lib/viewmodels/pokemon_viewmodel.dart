import 'package:flutter/material.dart';
import '../services/poke_api_service.dart';
import '../models/pokemon.dart';

class PokemonViewModel extends ChangeNotifier {
  final PokeApiService _apiService = PokeApiService();
  Pokemon? pokemon;
  bool isLoading = false;

  Future<void> fetchPokemonById(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      pokemon = await _apiService.fetchPokemonById(id);
      notifyListeners();
    } catch (e) {
      print('Error fetching Pokémon data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPokemonByName(String name) async {
    isLoading = true;
    notifyListeners();

    try {
      pokemon = await _apiService.fetchPokemonByName(name);
      notifyListeners();
    } catch (e) {
      print('Error fetching Pokémon data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
