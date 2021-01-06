import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_app/pages/addLocal.dart';
import 'package:rent_app/pages/componentes/cidades.dart';
import 'package:rent_app/pages/editLocal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocalizacaoPage extends StatefulWidget {
  @override
  _LocalizacaoPageState createState() => _LocalizacaoPageState();
}

class _LocalizacaoPageState extends State<LocalizacaoPage> {

  List<Localizacao> local = List<Localizacao>();

  Future<List<Localizacao>> getDataLocal() async {
    String url = "http://192.168.0.113/flutter/consultarLocal.php";
    var response = await http.get(url);

    var local2 = List<Localizacao>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJason in notesJson) {
        local2.add(Localizacao.fromJson(noteJason));
      }
    }
    print(json.decode(response.body));
    local = local2;

    return local2;
  }

  @override
  Widget build(BuildContext context) {
    getDataLocal().then((value) {
      setState(() {
        local.addAll(value);
      });
      Navigator.push(
            context, MaterialPageRoute(builder: (context) => LocalizacaoPage()));
    });

    return Scaffold(
      body: getBody(),
    );
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
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.yellow,
                        ),
                      )),
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 65,
                  child: Text(
                    "SELECIONE UMA LOCALIZAÇÃO",
                    style: TextStyle(
                        color: Colors.yellow[200],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  children: List.generate(local.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, top: 10, bottom: 10),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        child: MaterialButton(
                          minWidth: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF26648E),
                              ),
                              SizedBox(width: 10),
                              Text(local[index].nome,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Color(0xFF26648E),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              IconButton(
                                icon:
                                    Icon(Icons.edit, color: Colors.greenAccent),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditLocal(id: local[index].id, nome: local[index].nome, index: index,))),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    var url = "http://192.168.0.113/flutter/deletarLocal.php";
                                  http.post(url, body: {
                                  "id": local[index].id.toString(),
                                  });
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 15.0,
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFFFFE3B3),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => addLocal()));
                      },
                      child: Text("Adicionar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF26648E),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
