import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aluguel de Imóveis',
      home: Scaffold(
        appBar: AppBar(title: Text('Home', style: TextStyle(fontSize: 23, color: Colors.black,),),
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
        ),
        resizeToAvoidBottomPadding: false,
        body: Center(child: Text('Lista de Imóveis', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
      drawer: _drawer(),
     // ),
    )
    );
  }
}

Widget _drawer(){
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