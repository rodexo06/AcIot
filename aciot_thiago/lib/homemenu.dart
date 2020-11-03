import 'package:aciot/cardapiotier1.dart';
import 'package:aciot/customcircleavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'dart:async';

class HomeMenuWidget extends StatefulWidget {
  @override
  HomeMenuWidgetState createState() => HomeMenuWidgetState();
}

class HomeMenuWidgetState extends State<HomeMenuWidget> {
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
  HomePedidoWidgetState createState() => HomePedidoWidgetState();
}

class HomePedidoWidgetState extends State<HomePedidoWidget> {
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
  HomeCardMesaWidgetState createState() => HomeCardMesaWidgetState();
}

class HomeCardMesaWidgetState extends State<HomeCardMesaWidget> {
  String broker = 'test.mosquitto.org';
  int port = 1883;
  String clientIdentifier = 'DeviceESP8266te';
  String topic = 'ledSala/state'; // TROQUE AQUI PARA UM TOPIC EXCLUSIVO SEU

  bool isdevice = false;
  String temp = "--";
  String mesa = "--";
  String ssidgarcom = "--";
  String ssid = "--";
  String password = "--";

  mqtt.MqttClient client;
  mqtt.MqttConnectionState connectionState;

  StreamSubscription subscription;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _connect());
  }

  void _subscribeToTopic(String topic) {
    if (connectionState == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] Subscribing to ${topic.trim()}');
      client.subscribe(topic, mqtt.MqttQos.exactlyOnce);
    }
  }

  void _connect() async {
    client = mqtt.MqttClient(broker, '');
    client.port = port;
    client.keepAlivePeriod = 30;
    client.onDisconnected = _onDisconnected;

    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(clientIdentifier)
        .startClean() // Non persistent session for testing
        .keepAliveFor(30)
        .withWillQos(mqtt.MqttQos.atMostOnce);
    print('[MQTT client] MQTT client connecting....');
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } catch (e) {
      print(e);
      _disconnect();
    }

    if (client.connectionState == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] connected');
      setState(() {
        connectionState = client.connectionState;
      });
    } else {
      print('[MQTT client] ERROR: MQTT client connection failed - '
          'disconnecting, state is ${client.connectionState}');
      _disconnect();
    }

    subscription = client.updates.listen(_onMessage);
    _subscribeToTopic(topic);
  }

  void _disconnect() {
    print('[MQTT client] _disconnect()');
    client.disconnect();
    _onDisconnected();
  }

  void _onDisconnected() {
    print('[MQTT client] _onDisconnected');
    setState(() {
      //topics.clear();
      connectionState = client.connectionState;
      client = null;
      subscription.cancel();
      subscription = null;
    });
    print('[MQTT client] MQTT client disconnected');
  }

  void _onMessage(List<mqtt.MqttReceivedMessage> event) {
    print(event.length);
    final mqtt.MqttPublishMessage recMess =
        event[0].payload as mqtt.MqttPublishMessage;
    final String message =
        mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
        'payload is <-- ${message} -->');
    print(client.connectionState);
    print("[MQTT client] message with topic: ${event[0].topic}");
    print("[MQTT client] message with message: ${message}");
    HapticFeedback.vibrate();
    setState(() {
      temp = message;
      var temps = temp.split(",");
      ssidgarcom = temps[0];
      mesa = temps[1];
      storeAPInfos();
    });
  }

  storeAPInfos() async {
    String sAPSSID;
    String sPreSharedKey;
    try {
      sAPSSID = await WiFiForIoTPlugin.getWiFiAPSSID();
    } on PlatformException {
      sAPSSID = "";
    }

    try {
      sPreSharedKey = await WiFiForIoTPlugin.getWiFiAPPreSharedKey();
    } on PlatformException {
      sPreSharedKey = "";
    }

    setState(() {
      ssid = sAPSSID;
      password = sPreSharedKey;
      _isDeviceCorrect();
    });
  }

  void _isDeviceCorrect() {
    if (ssidgarcom == ssid) {
      isdevice = true;
    }
  }

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
                    //"Mesa",
                    ssidgarcom,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    mesa,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    //"Está chamando",
                    ssid,
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
