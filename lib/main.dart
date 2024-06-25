import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/pokemon_list_viewmodel.dart';
import 'views/pokemon_list_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PokemonListViewModel()..fetchPokemonList()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokéAPI App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonListView(),
    );
  }
}
