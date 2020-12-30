import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_app/pages/componentes/listas.dart';

class ImovelPage extends StatefulWidget {
  final String id;
  final String nome;
  final String img;
  final String tamanho;
  final String quarto;
  final String banheiro;
  final String vaga;
  final String aluguel;
  final String condominio;
  final String bairro;

  const ImovelPage(
      {Key key,
      this.id,
      this.nome,
      this.tamanho,
      this.img,
      this.quarto,
      this.banheiro,
      this.vaga,
      this.aluguel,
      this.condominio,
      this.bairro})
      : super(key: key);

  @override
  _ImovelPageState createState() => _ImovelPageState();
}

class _ImovelPageState extends State<ImovelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
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
      child: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_back),
              )),
        ),
        SizedBox(height: 10),
        Card(
          elevation: 5,
          child: Hero(
              tag: widget.id.toString(),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.img), fit: BoxFit.cover)),
              )),
        ),
        SizedBox(height: 10),
        Text(widget.nome,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                color: Colors.blue[900],
                fontWeight: FontWeight.bold)),
        Text(widget.bairro,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.indigo,
            )),
        Text(widget.tamanho + "m²",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.indigo)),
        Text(widget.quarto + " Quartos",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.indigo)),
        Text(widget.banheiro + " Banheiros",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.indigo)),
        Text(widget.vaga + " Vagas",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.indigo)),
        Text("R\$ " + widget.aluguel + " - Aluguel",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.indigo)),
        Text("R\$ " + widget.condominio + " - Condomínio",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.indigo)),
        SizedBox(height: 10),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Color(0xFFFFE3B3),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
            onPressed: () {
            },
            child: Text("Tenho interesse",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 19,color: Color(0xFF26648E), fontWeight: FontWeight.bold)),
          ),
        ),
      ]),
    );
  }
}
