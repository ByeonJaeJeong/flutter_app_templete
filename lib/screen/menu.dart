import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final pageName="Menu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        leadingWidth: 200.0,
        leading: FlatButton(
            onPressed: () => {},
            child: Row(
              children: <Widget>[Icon(Icons.chevron_left), Text("배달 주소",style: TextStyle(color: Colors.black,fontSize: 18))],
            )),
      ),
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
    );
  }
}
