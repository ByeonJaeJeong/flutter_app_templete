import 'package:flutter/material.dart';

class MenuSelect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuSelectState();
}

class _MenuSelectState  extends State<MenuSelect>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_outlined,color: Colors.red,),onPressed: (){},),backgroundColor: Colors.white,title: Text("맥딜리버리",style: TextStyle(color:Colors.black),),
        actions: [

          IconButton(icon: Icon(Icons.shopping_cart_outlined,color: Colors.red,), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert,color: Colors.red,), onPressed: (){})
        ],),
    );
  }
}