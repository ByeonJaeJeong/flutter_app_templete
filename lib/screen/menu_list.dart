import 'package:flutter/material.dart';
import 'package:flutter_app_templete/screen/menu_select_item.dart';

class MenuList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<String> menu_title= ["추천 메뉴","버거 & 세트","스낵 & 사이드", "음료", "디저트"," 해피밀"];


  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: Text("맥딜리버리",style: TextStyle(color: Colors.black),),
                floating: true,
                pinned: true,
                snap: true,
                backgroundColor: Colors.red,
                actions: [

                ],
                bottom: TabBar(
                  indicatorColor: Colors.yellow,
                  tabs:[
                    Container(width: 100 ,child: new Tab(text: "추천메뉴")),
                    Container(width: 100 ,child: new Tab(text: "버거 & 세트")),
                    Container(width: 100 ,child: new Tab(text: "스낵 & 사이드")),
                    Container(width: 100 ,child: new Tab(text: "음료")),
                    Container(width: 100 ,child: new Tab(text: "디저트")),
                    Container(width: 100 ,child: new Tab(text: "해피밀")),
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,// <-- total of 2 tabs
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[
              MenuSelectItem("추천메뉴"),
              MenuSelectItem("버거 & 세트"),
              MenuSelectItem("스낵 & 사이드"),
              MenuSelectItem("음료"),
              MenuSelectItem("디저트"),
              MenuSelectItem("해피밀"),
            ],
          ),
        ),
      ),
    );
  }
}
