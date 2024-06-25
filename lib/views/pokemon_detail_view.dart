import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/pokemon_viewmodel.dart';

class PokemonDetailView extends StatelessWidget {
  final int pokemonId;

  PokemonDetailView({required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Detalhes do Pokémon')),
        body: Consumer<PokemonViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (viewModel.pokemon == null) {
              viewModel.fetchPokemonById(pokemonId);
              return Center(child: CircularProgressIndicator());
            }

            // Extrair os nomes dos tipos
            String types = viewModel.pokemon!.types
                .map((type) => type['type']['name'])
                .join(', ');

            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(viewModel.pokemon!.imageUrl),
                  SizedBox(height: 16.0),
                  Text(
                    'Nome: ${viewModel.pokemon!.name}',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text('Altura: ${viewModel.pokemon!.height}'),
                  Text('Peso: ${viewModel.pokemon!.weight}'),
                  Text('Tipos: $types'), // Exibe os tipos do Pokémon
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
