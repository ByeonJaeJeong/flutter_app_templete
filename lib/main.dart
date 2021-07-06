import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_templete/screen/home.dart';
import 'package:flutter_app_templete/screen/menu_list.dart';
import 'package:flutter_app_templete/screen/menu_select.dart';
import 'package:flutter_app_templete/screen/menu_title.dart';
import 'package:flutter_app_templete/screen/more.dart';
import 'package:flutter_app_templete/screen/order_check.dart';
import 'package:flutter_app_templete/screen/star.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp= Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {

      },
      title: "Flutter BottomNavigation",
      theme: ThemeData(primarySwatch: Colors.blue),
      home:FutureBuilder(
        future: _fbApp,
        builder: (context,snapshot){
          if (snapshot.hasError){
            print('you have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          }else if(snapshot.hasData){
            return MyStatefulWidget(0);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
      //,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  int value = 0;

  MyStatefulWidget(int _value) {
    value = _value;
  }

  @override
  State<StatefulWidget> createState() => _MyStatefulWidgetState(value);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  void _incrementCounter(){
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Hello World ${Random().nextInt(100)}");
  }

  _MyStatefulWidgetState(int _currentIndex) {
    _currenttIndex = _currentIndex;
  }

  static int _currenttIndex = 0;
  String title;

  final List<Widget> _pages = [
    Home(),
    MenuTitle(),
    Star(),
    OrderCheck(),
    More(),
    MenuList(),
    MenuSelect()
  ];

  void _onTab(int index) {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context)=> MyStatefulWidget(index)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currenttIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: (_currenttIndex > 4) ? 1 : _currenttIndex,
        onTap: _onTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp), label: "메뉴"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "즐겨찾기"),
          BottomNavigationBarItem(
              icon: Icon(Icons.agriculture), label: "주문조회"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "더보기")
        ],
    ),
    );
  }
}
