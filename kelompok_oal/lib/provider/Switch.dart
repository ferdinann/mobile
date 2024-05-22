import 'package:flutter/material.dart';

class Mode extends ChangeNotifier {
  bool _enableDarkMode = false;

  bool get enableDarkMode => _enableDarkMode;

  set enableDarkMode(val) {
    _enableDarkMode = val;
    notifyListeners();
  }

  var light = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)));

  var dark = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
}
