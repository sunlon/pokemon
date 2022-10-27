part of 'pokemon_filter_bloc.dart';

@immutable
abstract class PokemonFilterState extends Equatable {}

class PokemonFilterLoading extends PokemonFilterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PokemonFilterLoaded extends PokemonFilterState {
  final List<PokemonModel> filteredPokemon;
  final PokemonFilter pokemonFilter;
  PokemonFilterLoaded(
      {required this.filteredPokemon,
      this.pokemonFilter = PokemonFilter.favorite});

  @override
  // TODO: implement props
  List<Object?> get props => [filteredPokemon, pokemonFilter];
}
