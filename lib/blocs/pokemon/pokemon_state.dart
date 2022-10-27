part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonLoadingState extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoadedState extends PokemonState {
  PokemonLoadedState(
    this.pokemons,
  );
  final List<PokemonModel> pokemons;

  @override
  List<Object> get props => [
        pokemons,
      ];
}

class FilterPokemonState extends PokemonState {
  FilterPokemonState(this.pokemons, this.isFavoriteFilter);
  final bool isFavoriteFilter;
  final List<PokemonModel> pokemons;

  @override
  List<Object> get props => [isFavoriteFilter];
}

class PokemonErrorState extends PokemonState {
  PokemonErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
