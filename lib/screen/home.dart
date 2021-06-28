import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_templete/screen/star.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../main.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageName = "Home";

  final List<String> imgList = [
    "https://www.mcdelivery.co.kr/kr//static/1623826717670/assets/82/banners/landing_66461_mWOS.jpg?mWOS",
    "https://www.mcdelivery.co.kr/kr//static/1623826717670/assets/82/banners/landing_66395_mWOS.jpg?mWOS",
    "https://www.mcdelivery.co.kr/kr//static/1623826717670/assets/82/banners/landing_66231_mWOS.jpg?mWOS"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leadingWidth: 300,
        leading: Row(children: <Widget>[
          SizedBox(width: 20),
          Image.asset(
            "assets/Mac.png",
            scale: 4,
          ),
          Text("  맥딜리버리", style: TextStyle(color: Colors.black, fontSize: 18))
        ]),
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text("EN", style: TextStyle(fontSize: 18)),
              textColor: Colors.red),
          FlatButton(
              onPressed: () {},
              child: Text("주문하기", style: TextStyle(fontSize: 18)),
              textColor: Colors.red),
          /*  IconButton(icon: Icon(Icons.login), onPressed: (){
            Provider.of<PageNotifier>(context,listen : false).goToOtherPage(AuthPage.pageName);
          })*/
        ],
      ),
      body: SafeArea(
        child: ListView(
          reverse: true,
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ Container(
                color: Color(0xFFDF0F4),
                height: MediaQuery.of(context).size.height/2,
                child: Swiper(
                  itemHeight: 500,
                  autoplay: true,
                  pagination: SwiperPagination(),
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(imgList[index],fit: BoxFit.fitWidth,);
                  },
                ),
              )
            ,Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                  child: FlatButton(
                    child: Image.asset("assets/mc_order_check_btn.png",width:MediaQuery.of(context).size.width/2,fit: BoxFit.fitWidth,),
                    padding: EdgeInsets.all(0),
                    onPressed: (){
                      Navigator.pushReplacement(context,  CupertinoPageRoute(builder: (context)=>BottomNavi(3)));
                    },
                  ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Image.asset("assets/mc_order_btn.png",width:MediaQuery.of(context).size.width/2,fit: BoxFit.fitWidth,),
                      onPressed: (){
                        Navigator.pushReplacement(context,  CupertinoPageRoute(builder: (context)=>BottomNavi(1)));
                      },
                    ),
                  )
                ],
              )
            ],
          )].reversed.toList(),
        ),
      ),
    );
  }
}
