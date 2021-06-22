import 'package:flutter/material.dart';


class More extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_MoreState();

}



class _MoreState extends State<More>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(children:<Widget>[Image.asset("assets/Mac.png",scale: 4,),Text("  맥딜리버리",style: TextStyle(color: Colors.black,fontSize: 18))]),
        actions: [
          FlatButton(onPressed: (){

          }, child: Text("주문하기",style: TextStyle(fontSize: 18)),textColor: Colors.red),
          /*  IconButton(icon: Icon(Icons.login), onPressed: (){
            Provider.of<PageNotifier>(context,listen : false).goToOtherPage(AuthPage.pageName);
          })*/
        ],
      ),
    );
  }
}