import 'package:flutter/material.dart';

class Obscure extends ChangeNotifier {
  bool _iconShow = true;

  bool get iconShow => _iconShow;

  Obscure({bool iconHidden = true}) {
    _iconShow = iconHidden;
  }

  void toogleVisible() {
    _iconShow = !_iconShow;
    notifyListeners();
  }
}

class serchClick extends ChangeNotifier {
  bool _searchClick = false;

  bool get searchClick => _searchClick;

  serchClick({bool searchFalse = false}) {
    _searchClick = searchFalse;
  }

  void toogleVisible() {
    _searchClick = !_searchClick;
    notifyListeners();
  }
}


