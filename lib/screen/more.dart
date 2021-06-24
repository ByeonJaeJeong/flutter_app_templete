import 'package:flutter/material.dart';
import 'package:flutter_app_templete/login/auth_page.dart';
import 'package:flutter_app_templete/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class More extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MoreState();
}

class _MoreState extends State<More> {
  static final storage = new FlutterSecureStorage();
  static String userInfo = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    await _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    userInfo = await storage.read(key: "loginId");
    print("userId:" + userInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(children: <Widget>[
          Image.asset(
            "assets/Mac.png",
            scale: 4,
          ),
          Text("  맥딜리버리", style: TextStyle(color: Colors.black, fontSize: 18))
        ]),
        actions: [
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
          padding: EdgeInsets.all(10),
          children: [
            Container(
              child: Text("계정 설정"),
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            Visibility(
              visible: (userInfo == null) ? true : false,
              child: Container(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AuthWidget()));
                  },
                  child: Row(
                    children: [Icon(Icons.arrow_circle_up), Text("  로그인/회원가입")],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: (userInfo == null) ? false : true,
              child: Container(
                child: FlatButton(
                  onPressed: () async {
                    await storage.delete(key: "loginId");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavi()));

                    },
                  child: Row(
                    children: [Icon(Icons.arrow_circle_down), Text("로그아웃")],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
