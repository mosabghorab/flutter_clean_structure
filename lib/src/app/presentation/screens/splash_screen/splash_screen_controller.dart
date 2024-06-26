import 'package:flutter/cupertino.dart';

class SplashScreenController with ChangeNotifier {
  // constructor.
  SplashScreenController() {
    _runDelayAndMove();
  }

  // run delay and move.
  void _runDelayAndMove() {
    Future.delayed(const Duration(seconds: 1), () {
      // N.offAllNamed(RoutesConstants.loginScreen);
    });
  }
}
