import 'package:AcIot/src/view/CardapioTier1.dart';
import 'package:AcIot/src/view/CustomCircleAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeMenuWidget extends StatefulWidget {
  @override
  _HomeMenuWidgetState createState() => _HomeMenuWidgetState();
}

class _HomeMenuWidgetState extends State<HomeMenuWidget> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, bottom: 7.5),
                    child: Card(
                      child: Container(
                        width: double.infinity,
                        height: size.height * 0.075,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.kitchen),
                            SizedBox(width: 10),
                            Text("Nome da Empresa")
                          ],
                        ),
                      ),
                    ),
                  ),
                  HomeCardMesaWidget(),
                  HomePedidoWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePedidoWidget extends StatefulWidget {
  @override
  _HomePedidoWidgetState createState() => _HomePedidoWidgetState();
}

class _HomePedidoWidgetState extends State<HomePedidoWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            width: double.infinity,
            height: size.height * 0.55,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Material(
                        color: Color(0xff125484),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardapioTier1Widget()));
                          },
                          child: Container(
                            width: size.width * 0.6,
                            height: size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.kitchen,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  Text(
                                    "Novo Pedido",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: size.height * 0.44,
                    child: ListView(
                      children: [
                        Card(
                          child: ListTile(
                            dense: true,
                            title: Text("Pedido #01"),
                            subtitle: Text("Faltam x itens"),
                            trailing: CustomCircleAvatar(
                              backgroundColor: Colors.white,
                              borderColor: Colors.black,
                              child: Text("X"),
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            dense: true,
                            title: Text("Pedido #02"),
                            subtitle: Text("Faltam x itens"),
                            trailing: CustomCircleAvatar(
                              backgroundColor: Colors.white,
                              borderColor: Colors.black,
                              child: Text("X"),
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            dense: true,
                            title: Text("Pedido #03"),
                            subtitle: Text("Faltam x itens"),
                            trailing: CustomCircleAvatar(
                              backgroundColor: Colors.white,
                              borderColor: Colors.black,
                              child: Text("X"),
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            dense: true,
                            title: Text("Pedido #04"),
                            subtitle: Text("Faltam x itens"),
                            trailing: CustomCircleAvatar(
                              backgroundColor: Colors.white,
                              borderColor: Colors.black,
                              child: Text("X"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeCardMesaWidget extends StatefulWidget {
  @override
  _HomeCardMesaWidgetState createState() => _HomeCardMesaWidgetState();
}

class _HomeCardMesaWidgetState extends State<HomeCardMesaWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
        child: Card(
          child: Container(
            width: double.infinity,
            height: size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Mesa",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "8",
                    style: TextStyle(
                        fontSize: 44,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "Esta chamando",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
