import 'package:flutter/material.dart';
import 'package:flutter_app_templete/main.dart';

class MenuTitle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuTitleState();
}

class _MenuTitleState extends State<MenuTitle> {
  final pageName = "Menu";
  List<String> menu_title= ["추천 메뉴","버거 & 세트","스낵 & 사이드", "음료", "디저트"," 해피밀"];
  List<String> menu_image= ["assets/cat10_1_ko.jpg","assets/cat11_1_ko.jpg","assets/cat13_1_ko.jpg","assets/cat14_1_ko.jpg","assets/cat15_1_ko.jpg","assets/cat16_1_ko.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("맥딜리버리",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: (){},
                child: Container(
                  padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black54,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("배달 받으실곳",style: TextStyle(color: Colors.grey,fontSize: 12),textAlign: TextAlign.left,),
                          Text("경상남도 양산시 삼호동 610-0 웅상신도시 푸르지오 110동 701호",overflow: TextOverflow.fade,style: TextStyle(color: Colors.orange,fontSize: 14),textAlign: TextAlign.left,),
                        ],
                      ),
                    ),
                      Container(width: 100,child: Icon(Icons.repeat))
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("예상 배달 시간/날짜",style: TextStyle(color: Colors.grey,fontSize: 12),textAlign: TextAlign.left,),
                    Text("40 - 55분",style: TextStyle(color: Colors.white,fontSize: 12),textAlign: TextAlign.left,)
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 6,
                itemBuilder: (BuildContext ctx, index) {
                  return SizedBox.fromSize(
                    // button width and height
                    child: ClipRect(
                      child: Material(
                        color: Colors.white, // button color
                        child: InkWell(
                          splashColor: Colors.orange, // splash color
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyStatefulWidget(5)));
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(menu_image[index],width: 90), // icon
                              Text(menu_title[index],style: TextStyle(fontWeight: FontWeight.bold),), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
