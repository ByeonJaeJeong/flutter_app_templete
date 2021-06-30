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
    String readId = await storage.read(key: "loginId");
    setState(() {
      userInfo = readId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leadingWidth: 200,
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
              child: Text("주문하기", style: TextStyle(fontSize: 18)),
              textColor: Colors.red),
          /*  IconButton(icon: Icon(Icons.login), onPressed: (){
            Provider.of<PageNotifier>(context,listen : false).goToOtherPage(AuthPage.pageName);
          })*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 5),
        child: Column(
          children: [
            Visibility(
            visible: (userInfo == null)?false:true,
            child: Expanded(
              child: ListView(
                children: <Widget>[
                  setTitle("맥딜리버리"),
                  divider(),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text("주문내역"),
                    onTap: () {},
                  ),
                 setTitle("계정설정"),
                  divider(),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text("내정보"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.library_books),
                    title: Text("주소록"),
                    onTap: () {},
                  ),
                 setTitle("이야기"),
                  divider(),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text("맥도날드이야기"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("영양정보/원산지정보"),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("로그아웃"),
                    onTap: () async {
                        await storage.delete(key: "loginId");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyStatefulWidget(4)));

                    },
                  ),
                  Text("3.2.11(KR50)",style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
          ),
            Visibility(
              visible: (userInfo == null)?true:false,
              child: Expanded(child: ListView(
               children: <Widget>[
                 setTitle("계정설정"),
                 divider(),
                 ListTile(
                   leading: Icon(Icons.login),
                   title: Text("로그인/회원가입"),
                   onTap: () {
                     Navigator.pushReplacement(context,
                         MaterialPageRoute(builder: (context) => AuthWidget()));
                   },
                 ),
                 setTitle("이야기"),
                 divider(),
                 ListTile(
                   leading: Icon(Icons.account_circle_outlined),
                   title: Text("맥도날드 이야기"),
                   onTap: () {},
                 ),
                 ListTile(
                   leading: Icon(Icons.info),
                   title: Text("영양정보/원산지정보"),
                   onTap: () {},
                 ),
                 SizedBox(
                   height: 30,
                 ),
                 Text("3.2.11(KR50)",style: TextStyle(color: Colors.grey))
               ],
              )
              ),
            )
          ],
        ),
      ),
    );
  }

  Divider divider() {
    return Divider(
                  height: 10,
                  thickness: 1,
                );
  }

  Container setTitle(String titleName) {
    return Container(
                    child: Text(
                  titleName,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ));
  }
}
