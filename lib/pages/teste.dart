import 'package:flutter/material.dart';

import 'componentes/listas.dart';
import 'imovel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ativo = 0;
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                label: Text('Filtrar',
                    style:
                        TextStyle(fontSize: 20, color: Colors.lightBlue[900])),
              ),
            ]),
          )
        ])),
        Row(
          children: List.generate(tiposImovel.length, (index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    ativo == index;
                  });
                },
                child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, right: 34, left: 32),
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
                        border: Border(
                            bottom: BorderSide(
                                color: ativo == index
                                    ? Colors.yellow
                                    : Colors.transparent,
                                width: 2))),
                    child: Text(
                      tiposImovel[index],
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    )));
          }),
        ),
        SizedBox(height: 15),
        Wrap(
            children: List.generate(dataItems.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ImovelPage(
              id: dataItems[index]['id'].toString(),
              nome: dataItems[index]['nome'],
              img: dataItems[index]['img'],
              tamanho: dataItems[index]['tamanho'].toString(),
              quarto: dataItems[index]['quarto'].toString(),
              banheiro: dataItems[index]['banheiro'].toString(),
              vaga: dataItems[index]['vaga'].toString(),
              aluguel: dataItems[index]['aluguel'].toString(),
              condominio: dataItems[index]['condominio'].toString(),
              bairro: dataItems[index]['bairro'],
              )));
            },
            child: Card(
              elevation: 2,
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: dataItems[index]['id'].toString(),
                    child: Container(
                    width: (size.width - 16)/2,
                    height: (size.width - 16)/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(dataItems[index]['img']),
                            fit: BoxFit.cover)),
                  ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    dataItems[index]['nome'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    dataItems[index]['bairro'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "R\$ " + dataItems[index]['aluguel'].toString(),
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
            color: Colors.cyan,
          ),
        ),
        ListTile(
          title: Text('Imóveis'),
          leading: Icon(Icons.house_rounded),
          //onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text('Meu perfil'),
          leading: Icon(Icons.account_circle),
        ),
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

