import 'package:flutter/material.dart';
import 'package:flutter_beermaker/string.dart';

class EtapeFabrication extends StatefulWidget {
  const EtapeFabrication({super.key, required this.title});

  final String title;

  @override
  State<EtapeFabrication> createState() => _EtapeFabrication();
}
class _EtapeFabrication extends State<EtapeFabrication> {

  int index = 0;

  Widget textafficher(){
    Widget content = const Padding(padding: EdgeInsets.all(16.0));
    setState(() {
    if(index == 0){
      content =  Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          children: const <Widget>[
            Text("${Strings.auprealable}", style: TextStyle(fontSize: 25,color: Colors.black),),
            Text("${Strings.etape0}")
          ],
        ),
      );
    }else if (index == 1){
      content =  Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          children: const <Widget>[
            Text("${Strings.empatage}", style: TextStyle(fontSize: 25,color: Colors.black),),
            Text("${Strings.etape1}")
          ],
        ),
      );
    }else if(index == 2){
      content =  Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          children: const <Widget>[
            Text("${Strings.brassageparpalier}", style: TextStyle(fontSize: 25,color: Colors.black),),
            Text("${Strings.etape2}")
          ],
        ),
      );
    }else if(index == 3){
      content =  Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          children: const <Widget>[
            Text("${Strings.filtrer}", style: TextStyle(fontSize: 25,color: Colors.black),),
            Text("${Strings.etape3}")
          ],
        ),
      );
    } else if(index == 4){
      content =  Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          children: const <Widget>[
            Text("${Strings.houblonnage}", style: TextStyle(fontSize: 25,color: Colors.black),),
            Text("${Strings.etape4}")
          ],
        ),
      );
    }else if (index == 5){
      content =  Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          children: const <Widget>[
            Text("${Strings.fermentation}", style: TextStyle(fontSize: 25,color: Colors.black),),
            Text("${Strings.etape5}")
          ],
        ),
      );
    }else if(index == 6){
      content =  Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          children: const <Widget>[
            Text("${Strings.sucrage}", style: TextStyle(fontSize: 25,color: Colors.black),),
            Text("${Strings.etape6}")
          ],
        ),
      );
    }else if(index == 7){
      content =  Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
          children: const <Widget>[
            Text("${Strings.miseenbouteille}", style: TextStyle(fontSize: 25,color: Colors.black),),
            Text("${Strings.etape7}")
          ],
        ),
      );
    }
  });


    return content;

  }

Widget Boutton(){
    Widget bout = Container();

    if(index == 0){
      bout = Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(""),
            IconButton(onPressed: (){
              setState(() {
                if(index == 7){
                  index = 7;
                }else {
                  index++;
                }
              });

            }, icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      );
    }

    if(index != 7 && index != 0){
      bout = Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              setState(() {
                  index--;
              });

            }, icon: Icon(Icons.arrow_back_ios)),
            IconButton(onPressed: (){
              setState(() {
               index++;
              });

            }, icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      );
    }


    if(index == 7){
      bout = Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
            setState(() {
              index--;
            });

          }, icon: Icon(Icons.arrow_back_ios)),
            const Text(""),

          ],
        ),
      );
    }
    return bout;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),


      ),
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/beermakerlogo350.png',
                    width: 100,
                  ),
                  const Text(
                    Strings.titleetapefabri,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey),
                  ),
                ],
              ),
              textafficher(),

             Boutton()
            ],
          )

      ),


    );

  }


}

