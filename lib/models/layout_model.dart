import 'package:flutter/material.dart';

import '../pags/homeScreen.dart';

class LayoutModel with ChangeNotifier{

Widget _currentPage = const HomeScreen();

set currentPage(Widget page){
  _currentPage = page;
  notifyListeners();
}

Widget get currentPage => _currentPage;

}