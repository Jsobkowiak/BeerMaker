import 'package:flutter/material.dart';
import 'string.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  'assets/beermakerlogo350.png',
                  width: 100,
                ),
                const Text(
                  Strings.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.grey),
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 1, 150),
                    primary: Colors.grey[300]),
                onPressed: () {
                  Navigator.pushNamed(context, "/etape-fabrication");
                },
                child: const Text(Strings.titlemenu1)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 1, 150),
                  primary: Colors.grey[300],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/outils-fabrication");
                },
                child: const Text(Strings.titlemenu2)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 1, 150),
                  primary: Colors.grey[300],
                ),
                onPressed: () {},
                child: const Text(Strings.titlemenu3)),
          ],
        ),
      ),
    );
  }
}
