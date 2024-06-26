import 'package:flutter/cupertino.dart';

class MyAppController with ChangeNotifier {
  // notifiable.
  bool _nApp = false;

  bool get nApp => _nApp;

  void notifyApp() {
    _nApp = !_nApp;
    notifyListeners();
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////
}
