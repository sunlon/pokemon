part of 'pokemon_filter_bloc.dart';

@immutable
abstract class PokemonFilterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateFilter extends PokemonFilterEvent {
  UpdateFilter();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdatePokemon extends PokemonFilterEvent {
  final PokemonFilter pokemonFilter;

  UpdatePokemon({this.pokemonFilter = PokemonFilter.favorite});
  @override
  // TODO: implement props
  List<Object?> get props => [pokemonFilter];
}
