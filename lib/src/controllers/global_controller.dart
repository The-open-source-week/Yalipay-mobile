import 'package:flutter/material.dart';

class GlobalController extends ChangeNotifier {
  Object? user;

  void getUserInfo() {
    user = double.parse("1.0");
    notifyListeners();
  }
}
