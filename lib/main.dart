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
        appBar: AppBar(
          title: Text(
            'Acessar',
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
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
            )),
          ),
        ),
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Trajan Pro', fontSize: 20.0);

  TextEditingController email = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  TextEditingController nome = new TextEditingController();

  String dropdownValue = 'Locatário';
  int dropdownNumber = 1;
  var tipos = ['Locatário', 'Locador'];

  bool signin = true;

  Future senddata() async {
    var url = "http://192.168.0.113/flutter/autenticar.php";
    var response = await http.post(url, body: {
      "email": email.text,
      "senha": senha.text,
    });

    if (email.text.isEmpty || senha.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Por favor preencha os campos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(response.body);
      var data = json.decode(response.body);

      if (data == "Erro!") {
        Fluttertoast.showToast(
            msg: "Cadastro inexistente",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (data == "Sucesso!") {
        Fluttertoast.showToast(
            msg: "Login OK",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        List user = [
          {"login": email.text, "tipo": 1}
        ];
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Fluttertoast.showToast(
            msg: "Usuário ou senha incorreto",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Future registerUser() async {
    var url = "http://192.168.0.113/flutter/cadastrar.php";
    var response = await http.post(url, body: {
      "nome": nome.text,
      "email": email.text,
      "senha": senha.text,
      "tipo": dropdownNumber.toString(),
    });

    print(response.body);
    var data = json.decode(response.body);

    if (data == "CJE") {
      Fluttertoast.showToast(
          msg: "Conta já existe",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (data == "sucesso") {
      Fluttertoast.showToast(
          msg: "Conta criada.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));
    } else {
      Fluttertoast.showToast(
          msg: "Erro.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    nome = new TextEditingController();
    email = new TextEditingController();
    senha = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
                            child: Text(
                              'Bem-vindo',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white38),
                            )),
                        SizedBox(height: 25.0),
                        boxUi(),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  void changeState() {
    if (signin) {
      setState(() {
        signin = false;
      });
    } else {
      setState(() {
        signin = true;
      });
    }
  }

  Widget boxUi() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () => changeState(),
                  child: Text(
                    "Entre",
                    style: TextStyle(
                        color: signin == true ? Colors.yellow : Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                    onPressed: () => changeState(),
                    child: Text(
                      "Cadastre-se",
                      style: TextStyle(
                          color: signin != true ? Colors.yellow : Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            signin == true ? signInUi() : signUpUi(),
          ],
        ),
      ),
    );
  }

  Widget signInUi() {
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0),
        TextField(
          style: style,
          keyboardType: TextInputType.emailAddress,
          controller: email,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              fillColor: Color(0xFFFFFFFF),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
        SizedBox(height: 25.0),
        TextField(
          obscureText: true,
          style: style,
          controller: senha,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              fillColor: Color(0xFFFFFFFF),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              hintText: "Senha",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
        SizedBox(height: 25.0),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Color(0xFFFFE3B3),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
            onPressed: () {
              senddata();
            },
            child: Text("ENTRAR",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Color(0xFF26648E), fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget signUpUi() {
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0),
        TextField(
          style: style,
          controller: nome,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              fillColor: Color(0xFFFFFFFF),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              hintText: "Nome",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
        SizedBox(height: 15.0),
        TextField(
          style: style,
          keyboardType: TextInputType.emailAddress,
          controller: email,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              fillColor: Color(0xFFFFFFFF),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
        SizedBox(height: 15.0),
        TextField(
          obscureText: true,
          style: style,
          controller: senha,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              fillColor: Color(0xFFFFFFFF),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              hintText: "Senha",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
        SizedBox(height: 15.0),
        DropdownButton(
          isExpanded: true,
          items: tipos.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String valor) {
            setState(() {
              this.dropdownValue = valor;
              if (valor == 'Locatário') {
                this.dropdownNumber = 1;
              } else {
                this.dropdownNumber = 2;
              }
            });
          },
          value: dropdownValue,
        ),
        SizedBox(height: 15.0),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Color(0xFFFFE3B3),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
            onPressed: () {
              print("Nome" + nome.text);
              print(email.text);
              print(senha.text);
              print(dropdownNumber.toString());
              if (email.text.isEmpty ||
                  senha.text.isEmpty ||
                  nome.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Por favor preencha os campos",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
              registerUser();
              }
            },
            child: Text("CADASTRAR",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Color(0xFF26648E), fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}

List lista = [
  {
    "id": 0,
    "nome": "",
    "img": "",
    "tamanho": "",
    "quarto": "",
    "banheiro": "",
    "vaga": "",
    "aluguel": "",
    "condominio": "",
    "bairro": ""
  }
];
