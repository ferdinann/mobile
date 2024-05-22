import 'package:flutter/material.dart';

class BottonNavigation extends ChangeNotifier {
  int _ttlNotif = 0;
  int _BNindex = 0;

  int get ttlNotif => _ttlNotif;
  int get bnIndex => _BNindex;

  set bnIdex(val) {
    _BNindex = val;
    notifyListeners();
  }

  setTTLNotif(int val) {
    _ttlNotif += val;
    if (_ttlNotif <= 0) _ttlNotif = 0;
    notifyListeners();
  }

  resetNotif() {
    _ttlNotif = 0;
    notifyListeners();
  }
}
