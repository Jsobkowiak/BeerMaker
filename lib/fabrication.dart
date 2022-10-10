import 'package:flutter/material.dart';
import 'package:flutter_beermaker/poo/recette.dart';
import 'string.dart';

class Fabrication extends StatefulWidget {
  const Fabrication({super.key, required this.title});

  final String title;

  @override
  State<Fabrication> createState() => _Fabrication();
}

class _Fabrication extends State<Fabrication> {
  final _formKey = GlobalKey<FormState>();

   late double volume;
   late double degres;
   late double EBC ;
   double SMR = 0;

   Recette recette = new Recette(1, 1, 1);


  void calcul() {
    setState(() {
      if (_formKey.currentState!.validate()) {

        recette.setVolume(volume);
        recette.setDegres(degres);
        recette.setMoyenne(EBC);
        SMR = recette.getSMR();
      }
    });
  }


  Widget color(){
    Widget colo = Container();
    setState(() {
  if(_formKey.currentState!.validate()){
    colo = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const[
              Text("${Strings.colimetrie}", style: TextStyle(fontSize: 25),),
            ],
          ),
          Row(
            children: [
              Text("${Strings.SMR + SMR.toString()}"),
            ],
          ),
          Row(
            children:  [
              Text("${Strings.EBC + recette.getEBC().toString()}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("${Strings.MCU}"),
              ElevatedButton(onPressed: (){}, child: Text("Couleurs"))
            ],
          )
        ],
      ),

    );
  }
});


  return colo;

  }


  Widget resultat(){

    Widget content = Container();
      setState(() {
    if(_formKey.currentState!.validate())
    {
      content =  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${Strings.quantitemalt + recette.getquantitemalt().toString()}"),
            Text("${Strings.volumeDeauBrassage + recette.getquantitedeaubrassage().toString()}"),
            Text("${Strings.volumeDeauRincage + recette.getquantitedeauderincage().toString()}"),
            Text("${Strings.qtitehoublontame + recette.getquantitehoubloname().toString()}"),
            Text("${Strings.qtitehoublontaro + recette.getquantitehoubloaro().toString()}"),
            Text("${Strings.qtitelevure + recette.getquantitelevure().toString()}"),
          ],
        ),
      );
    }
  });
      return content;
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ), body:SingleChildScrollView(
        child:
        Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                'assets/beermakerlogo350.png',
                width: 100,
              ),
              const Text(
                Strings.titlefabrication,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey),
              )
            ],
          ),
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                decoration:
                    const InputDecoration(labelText: Strings.volumefabrication),
                validator: (valeur) {
                  if (valeur == null || valeur.isEmpty) {
                    return 'Veuillez entrez une donnée valide';
                  } else {
                    volume = double.parse(valeur);
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: Strings.degrealcoolfabrication),
                validator: (valeur) {
                  if (valeur == null || valeur.isEmpty) {
                    return 'Veuillez entrez une donnée valide';
                  } else {
                    degres = double.parse(valeur);
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: Strings.MoyenneEBCfabrication),
                validator: (valeur) {
                  if (valeur == null || valeur.isEmpty) {
                    return 'Veuillez entrez une donnée valide';
                  } else {
                    EBC = double.parse(valeur);
                  }
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.50, 50),
                  ),
                  onPressed: calcul,
                  child: const Text(Strings.calculer),
                ),
              ),




                ],
              ))
            ]),
          )
    );
  }
}

