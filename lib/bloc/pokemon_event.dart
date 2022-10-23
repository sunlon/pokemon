part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class LoadPokemonEvent extends PokemonEvent {
  @override
  List<Object> get props => [];
}

class AddFavoritePokemonEvent extends PokemonEvent {
  const AddFavoritePokemonEvent(this.pokemons);
  final PokemonModel pokemons;
  @override
  List<Object> get props => [pokemons];
}

class FilterPokemonEvent extends PokemonEvent {
  const FilterPokemonEvent();

  @override
  List<Object> get props => [];
}

class ClearFilterPokemonEvent extends PokemonEvent {
  const ClearFilterPokemonEvent();

  @override
  List<Object> get props => [];
}
