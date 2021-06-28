import 'package:flutter/material.dart';

class OrderCheck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderCheckState();
}

class _OrderCheckState extends State<OrderCheck> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title:Text("주문조회",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              icon: Icon(Icons.autorenew_rounded),
              onPressed: () {},
              color: Colors.red,
              iconSize: 30)
        ],
      ),
    );
  }
}
