import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aluguel de Imóveis',
        home: Scaffold(
          appBar: _appBar(),
          resizeToAvoidBottomPadding: false,
          body: _body(),
          drawer: _drawer(),
          // ),
        ));
  }
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
        )
      ],
    ),
  );
}

Widget _appBar(){
  return AppBar(
            title: Text(
              'ALUGAR',
              style: TextStyle(
                fontSize: 23,
                color: Colors.yellow[100],
              ),
            ),
            centerTitle: true,
            elevation: 10,
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
                )
              ),
            ),
          );
}

Widget _body(){
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(7)),
        RaisedButton.icon(
          icon: Icon(Icons.location_on, color: Colors.lightBlue[900],),
          padding: EdgeInsets.all(5),
          color: Colors.white,
          elevation: 20,
          splashColor: Colors.blue[200],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          onPressed: () {},
          label: Text('Filtrar', style: TextStyle(fontSize: 20, color: Colors.lightBlue[900])),
        ),
      ]
    ),
  );
}