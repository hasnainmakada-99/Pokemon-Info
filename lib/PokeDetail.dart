import 'package:flutter/material.dart';
import 'package:pokemon_info/PokeHub.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokeDetail({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name.toString()),
      ),
      body: bodyWiget(context),
    );
  }

  bodyWiget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: pokemon.name.toString(),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              pokemon.img.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    pokemon.name.toString(),
                    style: const TextStyle(
                        fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height: ${pokemon.height}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Weight: ${pokemon.weight}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Types",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type!
                        .map(
                          (t) => FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(t),
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
                  ),
                  const Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses!
                        .map(
                          (t) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              t,
                              style: const TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          )
        ],
      );
}
