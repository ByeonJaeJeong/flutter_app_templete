import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StarState();
}

class _StarState extends State<Star> {
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
        leadingWidth: 300,
        centerTitle: true,
        title: Text("즐겨찾기",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
       automaticallyImplyLeading: true,
      ),
    );
  }
}
