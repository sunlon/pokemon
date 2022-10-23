import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';

class PokemonDetail extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(pokemon.name.toString())),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            //padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Card(
                  elevation: 0,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0)),
                  child: Image(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    image: NetworkImage(pokemon.imageurl.toString()),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              // color: Colors.white38,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  pokemon.xdescription.toString(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Height",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  pokemon.height.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  pokemon.category.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Weight",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  pokemon.weight.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Type of Pokemon",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  children: List.from(
                    pokemon.typeofpokemon!.map((name) {
                      var index = pokemon.typeofpokemon!.indexOf(name);
                      if (index != pokemon.typeofpokemon!.length - 1) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("$name,",
                              style: const TextStyle(fontSize: 20.0)),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child:
                            Text(name, style: const TextStyle(fontSize: 20.0)),
                      );
                    }

                        //Text(name)

                        ),
                  ),
                ),
                // Text(
                //   pokemon.typeofpokemon.toString(),
                //   style: const TextStyle(
                //     fontSize: 20.0,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Speed",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  pokemon.speed.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "HP",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  pokemon.hp.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Attack",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  pokemon.attack.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Defense",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  pokemon.defense.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
