import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokemon/models/pokemon_filter.dart';
import 'package:pokemon/models/pokemon_model.dart';

part 'pokemon_filter_event.dart';
part 'pokemon_filter_state.dart';

class PokemonFilterBloc extends Bloc<PokemonFilterEvent, PokemonFilterState> {
  final PokemonBloc _pokemonBloc;
  late StreamSubscription _pokemonSubscription;
  PokemonFilterBloc({required PokemonBloc pokemonBloc})
      : _pokemonBloc = pokemonBloc,
        super(PokemonFilterLoading()) {
    on<UpdateFilter>(_onUpdateFilter);
    on<UpdatePokemon>(_onUpdatePokemon);

    _pokemonSubscription = pokemonBloc.stream.listen((state) {
      add(UpdatePokemon());
    });
  }

  void _onUpdateFilter(UpdateFilter event, Emitter<PokemonFilterState> emit) {
    if (state is PokemonFilterLoading) {
      add(UpdatePokemon(pokemonFilter: PokemonFilter.favorite));
    }
    if (state is PokemonFilterLoaded) {
      final state = this.state as PokemonFilterLoaded;
      add(UpdatePokemon(pokemonFilter: state.pokemonFilter));
    }
  }

  void _onUpdatePokemon(UpdatePokemon event, Emitter<PokemonFilterState> emit) {
    final state = _pokemonBloc.state;
    if (state is PokemonLoadedState) {
      List<PokemonModel> pokemon = state.pokemons.where((pok) {
        //  return pok.favorite == true;
        switch (event.pokemonFilter) {
          case PokemonFilter.all:
            return true;
          case PokemonFilter.favorite:
            return pok.favorite == true;
        }
      }).toList();
      emit(PokemonFilterLoaded(
          filteredPokemon: pokemon, pokemonFilter: PokemonFilter.favorite));
    }
  }
}
