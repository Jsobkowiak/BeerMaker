import 'package:flutter/material.dart';
import 'package:flutter_beermaker/poo/recette.dart';
import 'package:flutter_beermaker/string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Recettes extends StatefulWidget {
  const Recettes({super.key, required this.title});

  final String title;

  @override
  State<Recettes> createState() => _Recettes();
}

class _Recettes extends State<Recettes> {
  bool recupRecette = false;
  Recette recette = new Recette(0, 0, 0);

  Scaffold afficherRecette() {
    Scaffold ressource = Scaffold();

    setState(() {
      recette.recuprecette();

      ressource = Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                'assets/beermakerlogo350.png',
                width: 100,
              ),
              const Text(
                Strings.titlemenu3,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey),
              )
            ],
          ),
          Text(recette.getAllid().toString())
        ])),
        bottomNavigationBar: Container(
          child: IconButton(
              onPressed: () {
                setState(() {
                  recette.recuprecette();
                });
              },
              icon: Icon(Icons.restart_alt)),
        ),
      );
    });

    return ressource;
  }

  @override
  Widget build(BuildContext context) {
    return afficherRecette();
  }
}
