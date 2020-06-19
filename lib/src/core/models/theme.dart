import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;
  setTheme(bool theme)async{
    _themeData = theme;

    notifyListeners();
  }
}