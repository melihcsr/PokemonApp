import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokodex/model/pokemon.dart';
import 'package:pokodex/pokeDetail.dart';
import 'package:pokodex/service/pokeService.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PokemonService().getPokemon();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 56, 56, 56),
        appBar: AppBar(
          title: const Text("Pokodex"),
          backgroundColor: Color.fromARGB(255, 56, 56, 56),
        ),
        body: Center(
            child: FutureBuilder<List<Pokemon>>(
                future: PokemonService().getPokemon(),
                builder: (context, snapshot) {
                  List<Pokemon> pokemonListesi = snapshot.data!;
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 0.85 / 1,
                          maxCrossAxisExtent: 200,
                        ),
                        itemCount: pokemonListesi.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PokeDetail(
                                          secilenPokemon:
                                              pokemonListesi[index]))),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: pokemonListesi[index].type![0] ==
                                              "Grass"
                                          ? Colors.green
                                          : pokemonListesi[index].type![0] ==
                                                  "Fire"
                                              ? Colors.red
                                              : pokemonListesi[index].type![0] ==
                                                      "Water"
                                                  ? Colors.blue
                                                  : pokemonListesi[index]
                                                              .type![0] ==
                                                          "Bug"
                                                      ? Colors.brown
                                                      : pokemonListesi[index]
                                                                  .type![0] ==
                                                              "Electric"
                                                          ? Colors.yellow
                                                          : pokemonListesi[index].type![0] ==
                                                                  "Normal"
                                                              ? Colors.orange
                                                              : pokemonListesi[index].type![0] ==
                                                                      "Poison"
                                                                  ? Colors
                                                                      .purple
                                                                  : pokemonListesi[index].type![0] ==
                                                                          "Dragon"
                                                                      ? const Color.fromARGB(
                                                                          255,
                                                                          6,
                                                                          79,
                                                                          83)
                                                                      : pokemonListesi[index].type![0] ==
                                                                              "Psychic"
                                                                          ? const Color.fromARGB(
                                                                              255,
                                                                              23,
                                                                              0,
                                                                              55)
                                                                          : pokemonListesi[index].type![0] == "Rock"
                                                                              ? Color.fromARGB(255, 217, 112, 212)
                                                                              : pokemonListesi[index].type![0] == "Ice"
                                                                                  ? Color.fromARGB(255, 0, 213, 255)
                                                                                  : Color.fromARGB(255, 21, 125, 99)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pokemonListesi[index].name.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: const Color.fromARGB(
                                                  255, 56, 56, 56),
                                            ),
                                            width: 70,
                                            height: 30,
                                            child: Center(
                                              child: Text(
                                                pokemonListesi[index]
                                                    .type![0]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 60.0),
                                          child: CachedNetworkImage(
                                              width: 110,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(),
                                              imageUrl:
                                                  pokemonListesi[index].img ??
                                                      ""),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        }));
                  } else if (snapshot.hasError) {
                    return const Text("Veriler Getirilemedi");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
