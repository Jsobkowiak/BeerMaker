import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_beermaker/homepage.dart';
import 'package:flutter_beermaker/menu.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const Menu(title: "BeerMaker"))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/beermakerlogo350.png',
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.50,
            ),
          ),
          Container(
            child: LoadingAnimationWidget.hexagonDots(
                color: Colors.black, size: 150),
          )
        ],
      ),
    );
  }
}
