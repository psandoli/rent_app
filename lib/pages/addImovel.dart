import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_app/pages/localizacao.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'meusImoveis.dart';

class NovoImovel extends StatefulWidget {
  @override
  _NovoImovelState createState() => _NovoImovelState();
}

class _NovoImovelState extends State<NovoImovel> {
  TextEditingController tipo = new TextEditingController();
  TextEditingController area = new TextEditingController();
  TextEditingController quar = new TextEditingController();
  TextEditingController banhe = new TextEditingController();
  TextEditingController vaga = new TextEditingController();
  TextEditingController bairro = new TextEditingController();
  TextEditingController aluguel = new TextEditingController();
  TextEditingController condo = new TextEditingController();

  File _image;
  final picker = ImagePicker();

  Future choiceImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Future registerImovel() async {
    final uri = Uri.parse("http://192.168.0.114/flutter/cadastrarImovel2.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['nome'] = tipo.text;
    request.fields['tamanho']= area.text;
    request.fields['quarto']= quar.text;
    request.fields['banheiro']= banhe.text;
    request.fields['vaga']= vaga.text;
    request.fields['aluguel']= aluguel.text;
    request.fields['condominio']= condo.text;
    request.fields['bairro']= bairro.text;
    var pic = await http.MultipartFile.fromPath("img", _image.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200){
      Fluttertoast.showToast(
          msg: "Imóvel criado.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MeusImoveis()));
    } else {
      Fluttertoast.showToast(
          msg: "Erro ao cadastrar imóvel",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
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
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 20),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.yellow,
                            child: _image == null ? MaterialButton(
                              height: 12,
                              minWidth: 12,
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              onPressed: () {
                                choiceImage();
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                            ) : Image.file(_image),
                          ),
                        ],
                      ),
                      SizedBox(height: 70),
                      Material(
                        elevation: 15.0,
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xFFFFE3B3),
                        child: MaterialButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LocalizacaoPage())),
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF26648E),
                              ),
                              SizedBox(width: 10),
                              Text("Localização",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Color(0xFF26648E),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: tipo,
                                decoration: InputDecoration(
                                    labelText: "Tipo",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: area,
                                decoration: InputDecoration(
                                    labelText: "Área (m²)",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: quar,
                                decoration: InputDecoration(
                                    labelText: "Nº quartos",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: banhe,
                                decoration: InputDecoration(
                                    labelText: "Nº banheiros",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: vaga,
                                decoration: InputDecoration(
                                    labelText: "Nº vagas",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: bairro,
                                decoration: InputDecoration(
                                    labelText: "Bairro",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: aluguel,
                                decoration: InputDecoration(
                                    labelText: "Aluguel (R\$)",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: condo,
                                decoration: InputDecoration(
                                    labelText: "Condomínio (R\$)",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFFFFE3B3),
                              child: MaterialButton(
                                minWidth:
                                    ((MediaQuery.of(context).size.width) / 2) -
                                        27,
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
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFFFFE3B3),
                              child: MaterialButton(
                                minWidth:
                                    ((MediaQuery.of(context).size.width) / 2) -
                                        35,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                                onPressed: () {
                                  if (tipo.text.isEmpty ||
                                      area.text.isEmpty ||
                                      quar.text.isEmpty ||
                                      banhe.text.isEmpty ||
                                      vaga.text.isEmpty ||
                                      bairro.text.isEmpty ||
                                      aluguel.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Por favor preencha os campos",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    registerImovel();
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
              ),
            ),
          )),
    );
  }
}
