import 'package:flutter/material.dart';
import 'package:flutter_app_templete/login/auth_page.dart';
import 'package:flutter_app_templete/pages/bottomNavigation.dart';
import 'package:flutter_app_templete/provider/page_notifier.dart';
import 'package:flutter_app_templete/screen/home.dart';
import 'package:flutter_app_templete/screen/menu.dart';
import 'package:flutter_app_templete/screen/more.dart';
import 'package:flutter_app_templete/screen/order_check.dart';
import 'package:flutter_app_templete/screen/star.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  //String currentPage = MyHomePage.pageName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "Flutter Bottomnavigation",
      theme:  ThemeData(
        primarySwatch: Colors.blue
      ),
      home: BottomNavi(),
    );
  }
}


class BottomNavi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BottomNaviState();

}
class _BottomNaviState extends State<BottomNavi>{
  int _counter = 0;
  int _currenttIndex = 0;
  final List<Widget> _pages=[Home(),Menu(),Star(),OrderCheck(),More()];

  void _onTab(int index){
    setState(() {
      _currenttIndex= index;
    });
  }

  void _incrementCounter(){
    setState(() {
      _counter++;
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
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "홈"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp),
              label: "메뉴"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "즐겨찾기"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.agriculture),
              label: "주문조회"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "더보기"
          )
        ],
      ),
    );
  }
}

/*body: Center(
child: _pages[_selectedIndex]),
bottomNavigationBar: BottomNavigationBar(
type: BottomNavigationBarType.fixed,
backgroundColor: Colors.grey,
selectedItemColor: Colors.white,
unselectedItemColor: Colors.white.withOpacity(.60),
selectedFontSize: 14,
unselectedFontSize: 14,
currentIndex:  _selectedIndex,
onTap: (int index){
setState(() {
_selectedIndex = index;
});
},
items: [
BottomNavigationBarItem(
icon: Icon(Icons.home),
label: "홈"
),
BottomNavigationBarItem(
icon: Icon(Icons.menu_book_sharp),
label: "메뉴"
),
BottomNavigationBarItem(
icon: Icon(Icons.star),
label: "즐겨찾기"
),
BottomNavigationBarItem(
icon: Icon(Icons.agriculture),
label: "주문조회"
),
BottomNavigationBarItem(
icon: Icon(Icons.menu),
label: "더보기"
)
],
),
*/


/*
return MultiProvider(
providers: [ChangeNotifierProvider(create: (_) => PageNotifier())],
child: MaterialApp(
title: 'Flutter Demo',
home: Consumer<PageNotifier>(
builder: (context, pageNotifier, child) {
return Navigator(
pages: [
MaterialPage(
key: ValueKey(MyHomePage.pageName),
child: MyHomePage(title: 'Flutter Demo Home Page')),
if (pageNotifier.currentPage == AuthPage.pageName) AuthPage(),
], //page 는 밑에있을수록 앞에 보임
onPopPage: (route, result) {
if (!route.didPop(result)) {
//지금 이루트가 다끝났어?
return false;
}
return true;
},
);
},
),
),
);*/
