import 'package:flutter/material.dart';
import 'package:flutter_beermaker/fabrication.dart';
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
          "/menu": (BuildContext context) => MyHomePage(title: Strings.title),
          "/outils-fabrication": (BuildContext context) =>
              Fabrication(title: Strings.title),
        });
  }
}
