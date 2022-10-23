import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/pages/pokemon_detail.dart';
import 'package:pokemon/pages/splash.dart';
import 'package:pokemon/resources/pokemon_repository.dart';
import 'package:pokemon/widgets/pokemon_card.dart';

void main() {
//  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  // FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
      home: RepositoryProvider(
        create: (context) => PokemonRepository(),
        child: BlocProvider(
          create: (context) => PokemonBloc(
            RepositoryProvider.of<PokemonRepository>(context),
          )..add(LoadPokemonEvent()),
          child: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state is PokemonLoadingState) {
                return const SplashScreen();
              }
              if (state is PokemonLoadedState) {
                return const Home();
              }
              if (state is FilterPokemonState) {
                return const Home();
              }
              return const Text("data");
            },
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Pokemon")),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadedState) {
            List<PokemonModel> pokemonlist = state.pokemons;

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
                    context
                        .read<PokemonBloc>()
                        .add(AddFavoritePokemonEvent(pokemonlist[index]));
                    setState(() {});
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
      ),
    );
  }
}
