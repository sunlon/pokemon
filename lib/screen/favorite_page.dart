import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokemon/blocs/pokemon_filter/pokemon_filter_bloc.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/pages/pokemon_detail.dart';

import '../widgets/pokemon_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFilterBloc, PokemonFilterState>(
      builder: (context, state) {
        if (state is PokemonFilterLoaded) {
          List<PokemonModel> pokemonlist = state.filteredPokemon;

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
                  context.read<PokemonBloc>().add(AddFavoritePokemonEvent(
                      pokemonlist[index].copyWith(
                          favorite:
                              pokemonlist[index].favorite! ? false : true)));
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
