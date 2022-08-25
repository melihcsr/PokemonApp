import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokodex/model/pokemon.dart';

class PokemonService {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Future<List<Pokemon>> getPokemon() async {
    List<Pokemon> pokemonList = [];

    var result = await Dio().get(_url);
    var pokeList = jsonDecode(result.data)["pokemon"];

    if (pokeList is List) {
      pokemonList = pokeList.map((e) => Pokemon.fromJson(e)).toList();
    }

    debugPrint(pokemonList.length.toString());

    return pokemonList;
  }
}
