import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  String id;
  String name;
  String imageurl;
  final typeofpokemon;
  bool? isFavorite;
  final Function addFavorite;
  final Function onTap;
  PokemonCard(
      {super.key,
      required this.id,
      required this.name,
      required this.imageurl,
      required this.typeofpokemon,
      required this.isFavorite,
      required this.addFavorite,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  //    height: 100,
                  //    width: double.infinity,

                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.blue,
                  ),
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8.0)),

                  //  color: Color(color),

                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                  ),
                ),
                Positioned(
                  //  right: 5,
                  child: Image(
                    height: 90,
                    width: 100,
                    fit: BoxFit.cover,
                    image: NetworkImage(imageurl),
                  ),
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: GestureDetector(
                    onTap: () => addFavorite(),
                    child: Icon(
                      Icons.favorite,
                      size: 30.0,
                      color: isFavorite!
                          ? Colors.red
                          : Colors.white, //0xffb74093  0xd7353333
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 4.0, right: 14.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      id,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: List.from(
                        typeofpokemon.map(
                          (name) =>
                              //Text(name)
                              Card(
                            elevation: 0,
                            // color: Colors.white38,
                            color: const Color(0xffedebeb),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(name,
                                  style: const TextStyle(fontSize: 10.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
