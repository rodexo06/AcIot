import 'package:flutter/material.dart';

class CardapioTierBebidaWidget extends StatefulWidget {
  @override
  _CardapioTierBebidaWidgetState createState() =>
      _CardapioTierBebidaWidgetState();
}

class _CardapioTierBebidaWidgetState extends State<CardapioTierBebidaWidget> {
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  Color defaultColor = Colors.white;
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 14);
  var menuSecrTextList = [
    'Fanta Laranja 300ml',
    'Fanta Uva 300ml',
    'Heineken Long Neck',
    'Litrão Skol',
  ];
  var menuSecrIconList = [
    (Icons.kitchen),
    (Icons.kitchen),
    (Icons.kitchen),
    (Icons.kitchen),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.blue),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.875,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            physics: new NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              Card(
                                color: Color(0xff125484),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.5),
                                  child: Material(
                                    color: Color(0xff125484),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          count1++;
                                        });
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          count1 = 0;
                                        });
                                      },
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(menuSecrIconList[0],
                                                  size: 40,
                                                  color: defaultColor),
                                              Text(menuSecrTextList[0],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: defaultColor)),
                                              SizedBox(height: 7),
                                              Text('Qtde: $count1',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: defaultColor,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                color: Color(0xff125484),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.5),
                                  child: Material(
                                    color: Color(0xff125484),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          count2++;
                                        });
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          count2 = 0;
                                        });
                                      },
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(menuSecrIconList[1],
                                                  size: 40,
                                                  color: defaultColor),
                                              Text(menuSecrTextList[1],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: defaultColor)),
                                              SizedBox(height: 7),
                                              Text('Qtde: $count2',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: defaultColor,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                color: Color(0xff125484),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.5),
                                  child: Material(
                                    color: Color(0xff125484),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          count3++;
                                        });
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          count3 = 0;
                                        });
                                      },
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(menuSecrIconList[2],
                                                  size: 40,
                                                  color: defaultColor),
                                              Text(menuSecrTextList[2],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: defaultColor)),
                                              SizedBox(height: 7),
                                              Text('Qtde: $count3',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: defaultColor,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                color: Color(0xff125484),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.5),
                                  child: Material(
                                    color: Color(0xff125484),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          count4++;
                                        });
                                      },
                                      onLongPress: () {
                                        setState(() {
                                          count4 = 0;
                                        });
                                      },
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(menuSecrIconList[3],
                                                  size: 40,
                                                  color: defaultColor),
                                              Text(menuSecrTextList[3],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: defaultColor)),
                                              SizedBox(height: 7),
                                              Text('Qtde: $count4',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: defaultColor,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Material(
                          color: Color(0xff125484),
                          child: InkWell(
                            onTap: () {},
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
                                      "Concluir Bebidas",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
