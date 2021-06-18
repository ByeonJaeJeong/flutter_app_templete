import 'package:flutter/material.dart';
import 'package:flutter_app_templete/pages/auth_page.dart';
import 'package:flutter_app_templete/pages/my_home.dart';
import 'package:flutter_app_templete/provider/page_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String currentPage = MyHomePage.pageName;


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_)
    =>
        PageNotifier()
    )],
    child: MaterialApp(
    title: 'Flutter Demo',
    home: Consumer<PageNotifier>(
    builder: (context,pageNotifier, child){
      return Navigator(
      pages: [
      MaterialPage(
      key: ValueKey(MyHomePage.pageName),
    child: MyHomePage(title: 'Flutter Demo Home Page')),
    if(pageNotifier.currentPage == AuthPage.pageName) AuthPage(),


    ],//page 는 밑에있을수록 앞에 보임
    onPopPage: (route, result) {
    if(!route.didPop(result)){
    //지금 이루트가 다끝났어?
    return false;
    }
    return true;
    },
    );
    },
    ),
    ),
    );
    }
}
