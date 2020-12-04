// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_app/pages/teste.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aluguel de Imóveis',
      home: Scaffold(
        appBar: AppBar(title: Text('Acessar', style: TextStyle(fontSize: 23, color: Colors.black,),),
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
        body: SafeArea(child: MyHomePage(),
        ),
      drawer: _drawer(),
      ),
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
        /*ListTile(
          title: Text('Imóveis'),
          leading: Icon(Icons.house_rounded),
          //onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text('Meu perfil'),
          leading: Icon(Icons.account_circle),
        )*/
      ],
    ),
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Trajan Pro', fontSize: 20.0);

	TextEditingController email=new TextEditingController();
	TextEditingController senha=new TextEditingController();


	Future senddata() async {
    var url = "https://192.168.0.112/flutter/autenticar.php";
	  var response = await http.post(url, 
      body: {
	      "email": email.text,
	      "senha": senha.text,
	    }
    );

    var data = json.decode(response.body);
    
    if (data == "Erro!"){
      Fluttertoast.showToast(
        msg: "Cadastro inexistente",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
        msg: "Login OK",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
      );
      Navigator.push(context, MaterialPageRoute(builder:(context) => Teste()));
    } /*else {
      Fluttertoast.showToast(
        msg: "Usuário ou senha incorreto",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }*/
  }

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      style: style,
      keyboardType: TextInputType.emailAddress,
      controller: email,
      decoration: InputDecoration(
          icon: Icon(Icons.email),
          fillColor: Color(0xFFFFFFFF),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: senha,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        fillColor: Color(0xFFFFFFFF),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        hintText: "Senha",
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );


    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Color(0xFFFFE3B3),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
        onPressed: () {senddata();},
        child: Text("ENTRAR",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Color(0xFF26648E), fontWeight: FontWeight.bold)),
      ),
    );

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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 155.0,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                        child: Text('Bem-vindo', style: TextStyle(fontSize: 30, color: Colors.white38),
                      )
                      ),
                      SizedBox(height: 45.0),
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButon,
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      )
    );
  }
}
