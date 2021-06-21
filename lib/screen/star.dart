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
        leading: FlatButton(
            onPressed: () => {},
            child: Row(
              children: <Widget>[Icon(Icons.chevron_left), Text("즐겨찾기",style: TextStyle(color: Colors.black,fontSize: 18))],
            )),
      ),
    );
  }
}
