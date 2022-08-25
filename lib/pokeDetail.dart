import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokodex/model/pokemon.dart';
import 'package:pokodex/pokeList.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon secilenPokemon;
  const PokeDetail({Key? key, required this.secilenPokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List ozellikler = [
      "Name",
      "Height",
      "Weight",
      "Spawn Time",
      "Weakness",
    ];
    List ozellikDeger = [
      secilenPokemon.name,
      secilenPokemon.height,
      secilenPokemon.weight,
      secilenPokemon.spawnTime,
      secilenPokemon.weaknesses![1],
    ];
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 340,
                color: secilenPokemon.type![0] == "Grass"
                    ? Colors.green
                    : secilenPokemon.type![0] == "Fire"
                        ? Colors.red
                        : secilenPokemon.type![0] == "Water"
                            ? Colors.blue
                            : secilenPokemon.type![0] == "Bug"
                                ? Colors.brown
                                : secilenPokemon.type![0] == "Electric"
                                    ? Colors.yellow
                                    : secilenPokemon.type![0] == "Normal"
                                        ? Colors.orange
                                        : secilenPokemon.type![0] == "Poison"
                                            ? Colors.purple
                                            : secilenPokemon.type![0] ==
                                                    "Dragon"
                                                ? const Color.fromARGB(
                                                    255, 6, 79, 83)
                                                : secilenPokemon.type![0] ==
                                                        "Psychic"
                                                    ? const Color.fromARGB(
                                                        255, 23, 0, 55)
                                                    : secilenPokemon.type![0] ==
                                                            "Rock"
                                                        ? const Color.fromARGB(
                                                            255, 217, 112, 212)
                                                        : secilenPokemon
                                                                    .type![0] ==
                                                                "Ice"
                                                            ? const Color
                                                                    .fromARGB(
                                                                255,
                                                                0,
                                                                213,
                                                                255)
                                                            : const Color
                                                                    .fromARGB(
                                                                255,
                                                                21,
                                                                125,
                                                                99)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, left: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 30),
                  child: Row(
                    children: [
                      Text(
                        secilenPokemon.name.toString(),
                        style: const TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          "#" + secilenPokemon.num.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 56, 56, 56),
                    ),
                    width: 70,
                    height: 30,
                    child: Center(
                      child: Text(
                        secilenPokemon.type![0].toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                          width: 110,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          imageUrl: secilenPokemon.img ?? ""),
                    ],
                  ),
                ),
              ],
            ),
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: ozellikler.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30.0, left: 10, right: 10),
                  child: Row(
                    children: [
                      Text(
                        ozellikler[index],
                        style: TextStyle(fontSize: 26),
                      ),
                      Spacer(),
                      Text(
                        ozellikDeger[index].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
