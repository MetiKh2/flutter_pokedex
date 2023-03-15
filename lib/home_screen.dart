import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List? pokedex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              child: Text(
                'Pokedex',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Positioned(
            top: 150,
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.4),
                          itemCount: pokedex?.length,
                          itemBuilder: (context, index) {
                            var typed = pokedex?[index]['type'];
                            var color = typed[0] == "Grass"
                                ? Colors.greenAccent
                                : typed[0] == "Fire"
                                    ? Colors.redAccent
                                    : typed[0] == "Water"
                                        ? Colors.blue
                                        : typed[0] == "Poison"
                                            ? Colors.deepPurpleAccent
                                            : typed[0] == "Electric"
                                                ? Colors.amber
                                                : typed[0] == "Rock"
                                                    ? Colors.grey
                                                    : typed[0] == "Ground"
                                                        ? Colors.brown
                                                        : typed[0] == "Psychic"
                                                            ? Colors.indigo
                                                            : typed[0] ==
                                                                    "Fighting"
                                                                ? Colors.orange
                                                                : typed[0] ==
                                                                        "Bug"
                                                                    ? Colors
                                                                        .lightGreenAccent
                                                                    : typed[0] ==
                                                                            "Ghost"
                                                                        ? Colors
                                                                            .deepPurple
                                                                        : typed[0] ==
                                                                                "Normal"
                                                                            ? Colors.black26
                                                                            : Colors.pink;
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        pokemonDetails: pokedex?[index],
                                        color: color,
                                        heroTag: index,
                                      ),
                                    ));
                              },
                              child: Card(
                                color: color,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: color,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -10,
                                        right: -10,
                                        child: Image.asset(
                                          'images/pokeball.png',
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      Positioned(
                                          top: 30,
                                          left: 20,
                                          child: Text(
                                            pokedex?[index]['name'] ?? '',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      Positioned(
                                          top: 50,
                                          left: 20,
                                          child: Text(typed.toString() ?? '',
                                              style: TextStyle(fontSize: 10))),
                                      Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: Image.network(
                                              pokedex?[index]['img'] ?? '')),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        print(pokedex);
        setState(() {});
      }
    });
  }
}
