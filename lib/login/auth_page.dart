import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_templete/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/*
// Create storage
final storage = new FlutterSecureStorage();

// Read value
String value = await storage.read(key: key);

// Read all values
Map<String, String> allValues = await storage.readAll();

// Delete value
await storage.delete(key: key);

// Delete all
await storage.deleteAll();

// Write value
await storage.write(key: key, value: value);
*/

class AuthPage extends Page {
  static final pageName = "AuthPage";

  //https://www.youtube.com/watch?v=IBzzsa5q-jo 1:41:30

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => AuthWidget());
  }
}

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  static final storage = new FlutterSecureStorage();//flutter_secure_storage 사용을 위한 초기화 작업

  static final double cornerRadius = 8.0;
  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(cornerRadius),
      borderSide: BorderSide(color: Colors.transparent, width: 0));

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cPasswordController = TextEditingController();

  bool isRegister = false;

  Duration _duration = Duration(milliseconds: 400);
  Curve _curve = Curves.fastLinearToSlowEaseIn;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/image.gif"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Form(
              key: _formkey, //해당 폼안에 텍스트 폼 필드를 입력한 값 테스트 하려고
              child: ListView(
                reverse: true,
                //밑에서 부터 쌓음(list reversed.toList)와 함께 사용하면 밑에서 부터 쌓을수있음
                padding: EdgeInsets.all(16),
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 36,
                    child: Image.asset("assets/gangplank_icon.png"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ButtonBar(
                    children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              isRegister = false;
                              _cPasswordController.text = "";
                              _passwordController.text = "";
                              _emailController.text = "";
                            });
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: isRegister
                                      ? FontWeight.w400
                                      : FontWeight.w600)),
                          textColor:
                              isRegister ? Colors.black45 : Colors.black87),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              isRegister = true;
                              _cPasswordController.text = "";
                              _passwordController.text = "";
                              _emailController.text = "";
                            });
                          },
                          child: Text("Register",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: isRegister
                                      ? FontWeight.w600
                                      : FontWeight.w400)),
                          textColor:
                              isRegister ? Colors.black87 : Colors.black45)
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  buildTextFormField("Email Address", _emailController,false),
                  SizedBox(
                    height: 16,
                  ),
                  buildTextFormField("Password", _passwordController,true),
                  SizedBox(
                    height: 16
                  ),
                  AnimatedContainer(
                      child: buildTextFormField(
                          "Conform Password", _cPasswordController,true),
                      duration: _duration,
                      height: isRegister ? 80 : 0,
                      curve: _curve),
                  SizedBox(
                    height: 16,
                  ),
                      FlatButton(
                      onPressed: () async {
                      if (_formkey.currentState.validate()) {
                          if(isRegister) {
                            isRegister=false;
                            _cPasswordController.text = "";
                            _passwordController.text = "";
                            _emailController.text = "";
                            Fluttertoast.showToast(msg: "this is Toast Message",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1);
                          }
                          else {
                           await storage.write(key: "loginId", value: _emailController.text.toString());
                           Navigator.of(context).maybePop();
                           Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>BottomNavi(4)));

                          }

                      }
                    },
                    child: Text(isRegister ? "Register" : "Login"),
                    color: Colors.white54,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(cornerRadius)),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 0,
                    //왼쪽 여백
                    endIndent: 0,
                    //오른쪽 여백
                    thickness: 1,
                    //선굵기
                    height: 33, // 탐 바텀 여백 포함 총 크기
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton('assets/google_icon.png', () async{
                        await storage.write(key: "loginId", value: "google");
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>BottomNavi(4)));

                      }),
                      _buildSocialButton('assets/instagram_icon.png', () async{
                        await storage.write(key: "loginId", value: "insta");
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>BottomNavi(4)));

                      }),
                      _buildSocialButton('assets/facebook_icon.png', () async{
                        await storage.write(key: "loginId", value: "facebook");
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>BottomNavi(4)));

                      })
                    ],
                  )
                ].reversed.toList(), //위젯을 반대로
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildSocialButton(String imagePath, Function onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white54),
      child: IconButton(
          icon: ImageIcon(AssetImage(imagePath)), onPressed: onPressed),
    );
  }

  TextFormField buildTextFormField(
      String labelText, TextEditingController controller,bool obscureText) {
    if(isRegister==false && controller == _cPasswordController)
      return null;
    return TextFormField(
      cursorColor: Colors.white,
      obscureText: obscureText,
      controller: controller,
      validator: (text) {

        //데이터 체킹할때 사용
        if (text == null ||
            text.isEmpty && controller != _cPasswordController) {
          return "입력창이 비어있어요!";
        }
        if (controller == _cPasswordController &&
            isRegister &&
            (text == null || text.isEmpty)) {
          return "비밀번호 확인부분 다시 입력하세요!!";
        }
        return null; //널을 반환하면 아무것도 없다고 알려줌
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: labelText,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          errorBorder: _border.copyWith(
              borderSide: BorderSide(color: Colors.black, width: 3)),
          errorStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black45),
    );
  }
}
