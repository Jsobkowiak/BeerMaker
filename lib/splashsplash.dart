import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_beermaker/menu.dart';

class Splashscreen extends State<MyHomePage> {


  @override
  void initState(){
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: "BeerMaker")))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child:
        Image.asset(
          'assets/beermakerlogo350.png',
          width: 100,
        ),
      ),
    );
  }



}
