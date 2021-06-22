import 'package:flutter/cupertino.dart';
import 'package:flutter_app_templete/pages/bottomNavigation.dart';

class PageNotifier extends ChangeNotifier{
  String _currentPage = MyHomePage.pageName;

  String get currentPage=> _currentPage;

  void goToMain(){
    _currentPage = MyHomePage.pageName;
    notifyListeners();
  }
  void goToOtherPage(String name){
    _currentPage = name;
    notifyListeners();
  }
}