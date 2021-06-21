import 'package:flutter/material.dart';


class OrderCheck extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_OrderCheckState();

}

class _OrderCheckState extends State<OrderCheck>{
  int _counter =0;

  void _incrementCounter(){
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
        leadingWidth:300.0,
        leading: FlatButton(
              onPressed: () => {},
              child: Row(
                children: <Widget>[Icon(Icons.chevron_left), Text("주문 조회",style: TextStyle(color: Colors.black,fontSize: 18))],
              )),
        actions: [
          IconButton(icon: Icon(Icons.autorenew_rounded), onPressed: (){},color: Colors.red,iconSize: 30)
        ],
      ),
    );
  }
}