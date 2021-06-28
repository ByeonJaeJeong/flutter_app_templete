import 'package:flutter/material.dart';
import 'package:flutter_app_templete/login/auth_page.dart';
import 'package:flutter_app_templete/screen/home.dart';
import 'package:flutter_app_templete/screen/menu.dart';
import 'package:flutter_app_templete/screen/more.dart';
import 'package:flutter_app_templete/screen/order_check.dart';
import 'package:flutter_app_templete/screen/star.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter BottomNavigation",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BottomNavi(0),
    );
  }
}

class BottomNavi extends StatefulWidget {
  int value =0;
  BottomNavi(int _value){
    value= _value;
  }
  @override
  State<StatefulWidget> createState() => _BottomNaviState(value);
}

class _BottomNaviState extends State<BottomNavi> {

  _BottomNaviState(int _currentIndex){
    _currenttIndex= _currentIndex;
  }
  static int _currenttIndex = 0;
  String title;

  final List<Widget> _pages = [Home(), Menu(), Star(), OrderCheck(), More()];

  void _onTab(int index) {
    setState(() {
      _currenttIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currenttIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currenttIndex,
        onTap: _onTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp), label: "메뉴"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "즐겨찾기"),
          BottomNavigationBarItem(icon: Icon(Icons.agriculture), label: "주문조회"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "더보기")
        ],
      ),
    );
  }
}
