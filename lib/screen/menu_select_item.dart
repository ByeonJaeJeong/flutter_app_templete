import 'package:flutter/material.dart';

class MenuSelectItem extends StatefulWidget{
  String itemtitle;
  MenuSelectItem(this.itemtitle);

  @override
  State<StatefulWidget> createState() =>_MenuSelectItemState(itemtitle);

  }

class _MenuSelectItemState  extends State<MenuSelectItem>{
  _MenuSelectItemState(this.itemtitle);
  String itemtitle;
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        ListTile(title: Text("ㅇ"),subtitle: Text("ㅇㅇ"),)
      ],
    );
  }
}

