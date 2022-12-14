import 'package:flutter/material.dart';
import 'package:flutter_beermaker/EtapeFabrication.dart';
import 'package:flutter_beermaker/fabrication.dart';
import 'package:flutter_beermaker/homepage.dart';
import 'package:flutter_beermaker/poo/recette.dart';
import 'package:flutter_beermaker/recette.dart';
import 'package:flutter_beermaker/string.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BeerMaker',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const MyHomePage(title: 'BeerMaker'),
        routes: <String, WidgetBuilder>{
          "/menu": (BuildContext context) => const Menu(title: Strings.title),
          "/outils-fabrication": (BuildContext context) =>
              const Fabrication(title: Strings.title),
          "/etape-fabrication": (BuildContext context) =>
              const EtapeFabrication(title: Strings.title),
          "/recette": (BuildContext context) =>
              const Recettes(title: Strings.title)
        });
  }
}
