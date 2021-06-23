import 'package:flutter/material.dart';
import 'package:flutter_app_templete/login/auth_page.dart';
import 'package:flutter_app_templete/provider/page_notifier.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {

  static final String pageName = "MyHomePage";

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex= 0;

  List _pages=[MyHomePage(),AuthPage(),Text("Page3"),Text("Page4"),Text("Page5")];
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
      body: Center(
          child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey.withOpacity(.60),
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
    );
  }

   _widgetOpions(int selectedIndex) {
      switch(_selectedIndex){
        case 0: Provider.of<PageNotifier>(context, listen: false)
            .goToMain(); break;
        case 1: Provider.of<PageNotifier>(context, listen: false)
            .goToOtherPage(AuthPage.pageName); break;
      }
  }
}


