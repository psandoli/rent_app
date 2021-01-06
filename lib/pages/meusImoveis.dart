import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rent_app/pages/editImovel.dart';
import 'package:rent_app/pages/novoImovel.dart';
import 'package:http/http.dart' as http;

import 'componentes/imovel.dart';

class MeusImoveis extends StatefulWidget {
  @override
  _MeusImoveisState createState() => _MeusImoveisState();
}

class _MeusImoveisState extends State<MeusImoveis> {
  List<Imovel> imoveis = List<Imovel>();

  Future<List<Imovel>> getDataImovel() async {
    String url = "http://192.168.0.113/flutter/consultarImovel.php";
    var response = await http.get(url);

    var imovel2 = List<Imovel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJason in notesJson) {
        imovel2.add(Imovel.fromJson(noteJason));
      }
    }
    imoveis = imovel2;
    return imovel2;
  }

  @override
  Widget build(BuildContext context) {
    getDataImovel().then((value) {
      setState(() {
        imoveis.addAll(value);
      });
    });

    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.9],
            colors: [
              Color(0xFF26648E),
              Color(0xFF53D2DC),
            ],
          ),
        ),
        child: Center(
            child: ListView(children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => NovoImovel()));
                      },
                      icon: Icon(Icons.add),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          Center(
            child: Wrap(
                children: List.generate(imoveis.length, (index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => EditImovel(list: imoveis, index: index,)));
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      children: <Widget>[
                        Hero(
                          tag: imoveis[index].id.toString(),
                          child: Container(
                            width: (size.width - 16) / 2,
                            height: (size.width - 16) / 2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imoveis[index].img),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          imoveis[index].nome,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          imoveis[index].bairro,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "R\$ " + imoveis[index].aluguel.toString(),
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ),
                  ));
            })),
          )
        ])));
  }
}
