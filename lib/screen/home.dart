import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_HomeState();

}

class _HomeState extends State<Home>{
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
        title: Row(children:<Widget>[Icon(Icons.menu,color: Colors.yellow,),Text("맥딜리버리",style: TextStyle(color: Colors.black,fontSize: 18))]),
        actions: [
          FlatButton(onPressed: (){}, child: Text("EN",style: TextStyle(fontSize: 18)),textColor: Colors.red),
          FlatButton(onPressed: (){}, child: Text("주문하기",style: TextStyle(fontSize: 18)),textColor: Colors.red),
          /*  IconButton(icon: Icon(Icons.login), onPressed: (){
            Provider.of<PageNotifier>(context,listen : false).goToOtherPage(AuthPage.pageName);
          })*/
        ],
      ),
    );
  }
}