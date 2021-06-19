import 'package:flutter/material.dart';
import 'package:flutter_app_templete/pages/auth_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("앱이름"),
        leading: IconButton(icon:Icon(Icons.menu),onPressed: (){

        }),
        actions: [
          IconButton(icon: Icon(Icons.login), onPressed: (){
            Provider.of<PageNotifier>(context,listen : false).goToOtherPage(AuthPage.pageName);
          })
        ],
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '현재 페이지는 메인페이지 입니다.',
            ),
          ],
        ),
      ),
    );
  }
}
