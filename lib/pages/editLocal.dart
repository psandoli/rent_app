import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rent_app/pages/localizacao.dart';

class EditLocal extends StatefulWidget {
  final String id;
  final String nome;
  final int index;
  EditLocal({this.id, this.nome, this.index});

  @override
  _EditLocalState createState() => _EditLocalState();
}

class _EditLocalState extends State<EditLocal> {
  TextEditingController nome = new TextEditingController();

  @override
  void initState() {
    if (widget.index != null) {
      nome.text = widget.nome.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Future editLocal() async {
    var url = "http://192.168.0.113/flutter/editarLocal.php";
    var response = await http.post(url, body: {
      "id": widget.id.toString(),
      "nome": nome.text,
    });

    print(response.body);
    var data = json.decode(response.body);

    if (data == "success") {
      Fluttertoast.showToast(
          msg: "Cidade alterada",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => LocalizacaoPage()));
    } else if (data == "error") {
      Fluttertoast.showToast(
          msg: "Erro.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => super.widget));
    }
  }

  Widget getBody() {
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
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: Text(
                        "EDITAR LOCALIZAÇÃO",
                        style: TextStyle(
                            color: Colors.yellow[200],
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nome,
                      decoration: InputDecoration(
                          labelText: "Nome",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Material(
                          elevation: 15.0,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFE3B3),
                          child: MaterialButton(
                            minWidth:
                                ((MediaQuery.of(context).size.width) / 2) - 27,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancelar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(width: 20),
                        Material(
                          elevation: 15.0,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFE3B3),
                          child: MaterialButton(
                            minWidth:
                                ((MediaQuery.of(context).size.width) / 2) - 27,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                            onPressed: () {
                              if (nome.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Por favor preencha o campo",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                editLocal();
                              }
                            },
                            child: Text("Salvar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF26648E),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
