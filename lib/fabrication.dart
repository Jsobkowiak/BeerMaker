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
  late double EBC;
  double SMR = 0;
  String quantitemalte = "";
  String volumeDeauBassage = "";
  String volumeDeauRincage = "";
  String qtitehoublontame = "";
  String qtitehoublontaro = "";
  String qtitelevure = "";
  String colimetrie = "";
  void calcul() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        Recette recette = new Recette(this.volume, this.degres, this.EBC);
        quantitemalte =
            "Quantité de malt :" + recette.getquantitemalt().toString();

        volumeDeauBassage = "Volume eau de brassage : " +
            recette.getquantitedeaubrassage().toString();

        volumeDeauRincage = "Volume eau de rinçage : " +
            recette.getquantitedeauderincage().toString();

        qtitehoublontame = "Quantité de houblon amérisant : " +
            recette.getquantitehoubloname().toString();

        qtitehoublontaro = "Quantité de houblon aromatique : " +
            recette.getquantitehoubloaro().toString();

        qtitelevure =
            "Quantité de levure : " + recette.getquantitelevure().toString();

        colimetrie = "Colimetrie";

        SMR = recette.getSMR();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text("$quantitemalte"),
                  ),
                  Container(
                    child: Text("$volumeDeauBassage"),
                  ),
                  Container(
                    child: Text("$volumeDeauRincage"),
                  ),
                  Container(
                    child: Text("$qtitehoublontame"),
                  ),
                  Container(
                    child: Text("$qtitehoublontaro"),
                  ),
                  Container(
                    child: Text("$qtitelevure"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "$colimetrie",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: const Text("EMC"),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("test",
                              style: TextStyle(
                                  color: Color(Recette.srmToRGB(SMR)))))
                    ],
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
