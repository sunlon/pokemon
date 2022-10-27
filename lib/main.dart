import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokemon/blocs/pokemon_filter/pokemon_filter_bloc.dart';

import 'package:pokemon/pages/splash.dart';
import 'package:pokemon/resources/pokemon_repository.dart';

import 'screen/home_page.dart';

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
    return RepositoryProvider(
      create: (context) => PokemonRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokemonBloc(
              RepositoryProvider.of<PokemonRepository>(context),
            )..add(LoadPokemonEvent()),
          ),
          BlocProvider(
            create: (context) => PokemonFilterBloc(
                pokemonBloc: BlocProvider.of<PokemonBloc>(context)),
          )
        ],
        child: MaterialApp(
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
          home: BlocBuilder<PokemonBloc, PokemonState>(
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
