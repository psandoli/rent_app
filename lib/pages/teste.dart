import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rent_app/main.dart';
import 'package:rent_app/pages/componentes/imovel.dart';
import 'package:rent_app/pages/meusImoveis.dart';
import 'imovelDetalhes.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ativo = 0;

  List<Imovel> imoveis = List<Imovel>();

  getDataImovel() async {
    String url = "http://192.168.0.114/flutter/consultarImovel.php";
    var response = await http.get(url);

    var imovel2 = List<Imovel>();

    if(response.statusCode == 200){
      var notesJson = json.decode(response.body);
      for (var noteJason in notesJson){
        imovel2.add(Imovel.fromJson(noteJason));
      }
    }
    imoveis=imovel2;
  }

  @override
  Widget build(BuildContext context) {
    getDataImovel().then((value) {
      setState(() {
        imoveis.addAll(value);
      });
    });
    
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      drawer: _drawer(),
    );
  }

  Widget _body() {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: ListView(
      children: <Widget>[
        Center(
            child: Row(children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 302),
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
            child: Row(
              children: <Widget>[
              Padding(padding: EdgeInsets.all(7)),
              RaisedButton.icon(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.lightBlue[900],
                ),
                padding: EdgeInsets.all(5),
                color: Colors.white,
                elevation: 20,
                splashColor: Colors.blue[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                onPressed: () {
                },
                label: Text('Filtrar',
                    style:
                        TextStyle(fontSize: 20, color: Colors.lightBlue[900])),
              ),
            ]),
          )
        ])),
        SizedBox(height: 15),
        Wrap(
            children: List.generate(imoveis.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ImovelPage(
              id: imoveis[index].id.toString(),
              nome: imoveis[index].nome,
              img: imoveis[index].img,
              tamanho: imoveis[index].tamanho.toString(),
              quarto: imoveis[index].quarto.toString(),
              banheiro: imoveis[index].banheiro.toString(),
              vaga: imoveis[index].vaga.toString(),
              aluguel: imoveis[index].aluguel.toString(),
              condominio: imoveis[index].condominio.toString(),
              bairro: imoveis[index].bairro,
              localizacao: imoveis[index].localizacao,
              )));
            },
            child: Card(
              elevation: 2,
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: imoveis[index].id.toString(),
                    child: Container(
                    width: (size.width - 16)/2,
                    height: (size.width - 16)/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imoveis[index].img),
                            fit: BoxFit.cover)),
                  ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    imoveis[index].nome,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              )
          );
        })),
        SizedBox(height: 20),
      ],
    ));
  }

  Widget _drawer() {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text('Menu'),
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
        )
        ),
        ListTile(
          title: Text('Meus imóveis'),
          leading: Icon(Icons.house_outlined),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MeusImoveis())),
        ),
        ListTile(
          title: Text('Sair'),
          leading: Icon(Icons.login_outlined),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp())),
        )
      ],
    ),
  );
}

AppBar _appBar() {
  return AppBar(
    title: Text(
      'ALUGAR',
      style: TextStyle(
        fontSize: 23,
        color: Colors.yellow[100],
      ),
    ),
    centerTitle: true,
    elevation: 0,
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
    ],
    flexibleSpace: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF26646E),
          Color(0xFF53D2EC),
        ],
        stops: [0.2, 1.0],
      )),
    ),
  );
}

}
