import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_bloc.dart';
import '../models/pokemon_model.dart';
import '../pages/pokemon_detail.dart';
import '../widgets/pokemon_card.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state is PokemonLoadedState) {
          List<PokemonModel> pokemonlist = state.pokemons;

          return GridView.builder(
            padding: const EdgeInsets.all(12.0),
            //  padding: const EdgeInsets.symmetric(horizontal: 30),
            shrinkWrap: true,
            itemCount: pokemonlist.length,
            itemBuilder: (_, index) {
              return PokemonCard(
                id: pokemonlist[index].id.toString(),
                name: pokemonlist[index].name.toString(),
                imageurl: pokemonlist[index].imageurl.toString(),
                typeofpokemon: pokemonlist[index].typeofpokemon,
                isFavorite: pokemonlist[index].favorite,
                addFavorite: () {
                  context
                      .read<PokemonBloc>()
                      .add(AddFavoritePokemonEvent(pokemonlist[index]));
                  setState(() {});
                },
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PokemonDetail(
                                pokemon: pokemonlist[index],
                              )));
                },
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 0.0,
              //mainAxisExtent: 160,
            ),
          );
        }
        return Container();
      },
    );
  }
}
