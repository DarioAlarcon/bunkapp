import 'package:flutter/material.dart';

import '../testing/testingScreen.dart';

class LayoutModel with ChangeNotifier{

Widget _currentPage = HomeScreen();

set currentPage(Widget page){
  this._currentPage = page;
  notifyListeners();
}

Widget get currentPage => this._currentPage;

}