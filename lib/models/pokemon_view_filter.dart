import 'package:pokemon/models/pokemon_model.dart';

enum PokemonViewFilter { all, favorite }

extension PokemonViewFilterX on PokemonViewFilter {
  bool? apply(PokemonModel pokemon) {
    switch (this) {
      case PokemonViewFilter.all:
        return true;
      case PokemonViewFilter.favorite:
        return pokemon.favorite;
    }
  }
}
