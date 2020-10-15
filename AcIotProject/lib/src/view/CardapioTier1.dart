import 'package:flutter/material.dart';

import 'CardapioTierBebidas.dart';

class CardapioTier1Widget extends StatefulWidget {
  @override
  _CardapioTier1WidgetState createState() => _CardapioTier1WidgetState();
}

class _CardapioTier1WidgetState extends State<CardapioTier1Widget> {
  Color defaultColor = Colors.white;
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 14);
  var menuSecrTextList = [
    'Bebidas',
    'Refeiçoes',
    'Petiscos',
    'Sobremesas',
  ];
  var menuSecrIconList = [
    (Icons.kitchen),
    (Icons.kitchen),
    (Icons.kitchen),
    (Icons.kitchen),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.blue),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
              child: Container(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    physics: new NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardapioTierBebidaWidget()));
                          },
                          child: Card(
                            color: Color(0xff125484),
                            child: Center(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Icon(menuSecrIconList[0],
                                      size: 50, color: defaultColor),
                                  Text(menuSecrTextList[0],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18, color: defaultColor))
                                ])),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            color: Color(0xff125484),
                            child: Center(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Icon(menuSecrIconList[1],
                                      size: 50, color: defaultColor),
                                  SizedBox(height: 5),
                                  Text(menuSecrTextList[1],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18, color: defaultColor))
                                ])),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            color: Color(0xff125484),
                            child: Center(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Icon(menuSecrIconList[2],
                                      size: 50, color: defaultColor),
                                  SizedBox(height: 5),
                                  Text(menuSecrTextList[2],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18, color: defaultColor))
                                ])),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            color: Color(0xff125484),
                            child: Center(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Icon(menuSecrIconList[3],
                                      size: 50, color: defaultColor),
                                  SizedBox(height: 5),
                                  Text(menuSecrTextList[3],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18, color: defaultColor))
                                ])),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
