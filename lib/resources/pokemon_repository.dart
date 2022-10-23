import 'dart:convert';
import 'package:http/http.dart';
import 'package:pokemon/models/pokemon_model.dart';

class PokemonRepository {
  String endpoint =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';
  getPokemon() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
