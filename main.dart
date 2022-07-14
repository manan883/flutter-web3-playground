import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web3/ethereum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class methods extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tw',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'test website to show knowledge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String changer = "";

  void _changeState() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // print(r.nextInt(2));
      var g = Random().nextInt(3000);
      changer = "state" + g.toString();
      print(g);
      // if (g == 1) {
      //   changer = "state1";
      //   print("1");
      // }
      // if (g == 2) {
      //   changer = "state2";
      //   print("2");
      // }
      _counter++;
    });
  }

  static mint() {
    const connectingField = 0;
    String currentAddress = '';
    var account = "";
    int? currentChain;
    bool isEnabled = ethereum != null;
    bool isInOperatingChain = currentChain == connectingField;
    bool isConnected = isEnabled && currentAddress.isNotEmpty;
  }

  static connectWallet() async {
    const connectingField = 0;
    String currentAddress = '';
    var account = "";
    int? currentChain;
    bool isEnabled = ethereum != null;
    bool isInOperatingChain = currentChain == connectingField;
    bool isConnected = isEnabled && currentAddress.isNotEmpty;

    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      account = accs[0];
      if (accs.isNotEmpty) currentAddress = accs.first;
      currentChain = await ethereum!.getChainId();
    } else if (isConnected) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(changer),
        // actions: <Widget>[
        leading: IconButton(
            icon: const Icon(Icons.change_circle),
            iconSize: 40,
            tooltip: 'Change',
            color: Colors.redAccent,
            onPressed: _changeState),
        //],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.trending_up_outlined),
          onPressed: _changeState),
      body: Column(children: [titleSection, body1, body2]),
    );
  }

  Widget titleSection = Container(
    padding: EdgeInsets.only(top: 30),
    height: 200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: const Text(
                "This is a basic page using Flutter",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Image.network(
              'https://images.unsplash.com/photo-1542831371-29b0f74f9713?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29kaW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
              fit: BoxFit.fitWidth,
              height: 130,
            ),
          ],
        ))
      ],
    ),
  );
  Widget body1 = Container(
    height: 200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: const Text(
                "Filler text for now, Filler text for now, Filler text for now, Filler text for now, Filler text for now, Filler text for now, Filler text for now, Filler text for now, ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white70),
              ),
            ),
          ],
        ))
      ],
    ),
  );

  Widget body2 = Container(
    height: 100,
    padding: EdgeInsets.only(top: 20, left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Container(
        FloatingActionButton(
          onPressed: () {
            connectWallet();
            //connectWallet();
            //print("object");
          },
          child: const Icon(Icons.api),
          backgroundColor: Colors.teal,
          tooltip: "Connect Wallet",
        ),
        // ),
      ],
    ),
  );
}
