import 'package:flutter/material.dart';
import 'package:pokemon/screen/favorite_page.dart';
import 'package:pokemon/screen/pokemon_page.dart';

import 'package:pokemon/screen/search_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      PokemonPage(),
      FavoritePage(),
      SearchPage(),
    ];

    void onTap(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Pokemon")),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
