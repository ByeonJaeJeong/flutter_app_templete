import 'package:flutter/material.dart';
import 'package:flutter_app_templete/login/auth_page.dart';
import 'package:flutter_app_templete/screen/home.dart';
import 'package:flutter_app_templete/screen/menu_list.dart';
import 'package:flutter_app_templete/screen/menu_select.dart';
import 'package:flutter_app_templete/screen/menu_title.dart';
import 'package:flutter_app_templete/screen/more.dart';
import 'package:flutter_app_templete/screen/order.dart';
import 'package:flutter_app_templete/screen/order_check.dart';
import 'package:flutter_app_templete/screen/star.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {

      },
      title: "Flutter BottomNavigation",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyStatefulWidget(0),
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
        unselectedItemColor: Colors.white.withOpacity(.60),
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
