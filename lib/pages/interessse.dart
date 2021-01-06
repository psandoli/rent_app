import 'package:flutter/material.dart';

class TenhoInteresse extends StatefulWidget {
  @override
  _TenhoInteresseState createState() => _TenhoInteresseState();
}

class _TenhoInteresseState extends State<TenhoInteresse> {
  TextEditingController mensagem = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back),
                      )),
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 125,
                  child: Text(
                    "Entre em contato com o proprietário!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.yellow[200],
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextField(
                    controller: mensagem,
                    maxLines: 12,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Digite sua mensagem...',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFFFFE3B3),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                      onPressed: () {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TenhoInteresse()));*/
                      },
                      child: Text("Enviar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF26648E),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ))));
  }
}
