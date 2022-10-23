// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/resources/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;
  PokemonBloc(this._pokemonRepository) : super(PokemonLoadingState()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(PokemonLoadingState());

      try {
        final pokemons = await _pokemonRepository.getPokemon();
        emit(PokemonLoadedState(pokemons));
      } catch (e) {
        emit(PokemonErrorState(e.toString()));
      }
    });

    on<AddFavoritePokemonEvent>(_addFavorite);
    on<FilterPokemonEvent>(_filterFavorite);
    on<ClearFilterPokemonEvent>(_clearfilterFavorite);
  }

  void _addFavorite(
      AddFavoritePokemonEvent event, Emitter<PokemonState> emit) async {
    try {
      final state = this.state;
      final pokemon = event.pokemons;

      if (state is PokemonLoadedState) {
        final List<PokemonModel> pokemons = state.pokemons;
        pokemons.firstWhere((element) => element == pokemon).favorite =
            pokemon.favorite! ? false : true;
        //  ..remove(pokemon);
        //  pokemon.favorite == false
        //    ? pokemons.add(pokemon.)
        //  : pokemons.add(pokemon);
        //    emit(FilterPokemonState(state.pokemons, true));
        emit(PokemonLoadedState(state.pokemons));
      }
    } catch (e) {
      //  print("somethign wrong ${stack.toString()}");
      emit(PokemonErrorState(e.toString()));
    }
  }

  void _clearfilterFavorite(
      ClearFilterPokemonEvent event, Emitter<PokemonState> emit) async {
    try {
      final state = this.state;
      // final pokemon = event.pokemons;

      if (state is FilterPokemonState) {
        final List<PokemonModel> pokemons = state.pokemons;
        emit(PokemonLoadedState(pokemons));
      }
    } catch (e) {
      //  print("somethign wrong ${stack.toString()}");
      emit(PokemonErrorState(e.toString()));
    }
  }

  void _filterFavorite(
      FilterPokemonEvent event, Emitter<PokemonState> emit) async {
    try {
      final state = this.state;
      // final pokemon = event.pokemons;

      if (state is PokemonLoadedState) {
        final List<PokemonModel> pokemons = state.pokemons;
        final result = pokemons
            .where(
              (element) => element.favorite == true,
            )
            .toList();
        // state
        //     .pokemons[state.pokemons
        //         .indexWhere((element) => element.id == pokemon.id)]
        //     .favorite = true;
        //  final List<PokemonModel> pokemons = state.pokemons;
        //  pokemons.firstWhere((element) => element == pokemon).favorite =
        //      pokemon.favorite! ? false : true;
        //  //  ..remove(pokemon);
        //  pokemon.favorite == false
        //    ? pokemons.add(pokemon.)
        //  : pokemons.add(pokemon);
        emit(FilterPokemonState(result, true));
      }
    } catch (e) {
      //  print("somethign wrong ${stack.toString()}");
      emit(PokemonErrorState(e.toString()));
    }
  }
}
