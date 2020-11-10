import 'package:flutter/material.dart';
import 'package:aciot/homemenu.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  Color defaultColor = Color(0xff125484);
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 14);

  TextEditingController nameController = TextEditingController();
  String hotspot_ssid = "";

  void _limparCampos() {
    nameController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.blue),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Insira o nome da rede do Hotspot"),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      onChanged: (text) {
                        setState(() {
                          hotspot_ssid = text;
                        });
                      },
                      controller: nameController,
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      child: Text("Concluído"),
                      color: Colors.blueGrey,
                      onPressed: () {
                        _limparCampos();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeMenuWidget(hotspot_ssid)));
                        print("valor digitado:" + nameController.text);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
