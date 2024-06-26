import 'package:flutter/material.dart';
import 'package:new_streamline/src/app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:new_streamline/src/app/presentation/screens/splash_screen/splash_screen_controller.dart';
import 'package:new_streamline/src/core/routing/routes_constants.dart';
import 'package:provider/provider.dart';

abstract class RouterManager {
  // on generate route.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final String screenName = settings.name!;
    late final dynamic screenArgs = settings.arguments;
    if (screenName == RoutesConstants.splashScreen) {
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<SplashScreenController>(
          create: (_) => SplashScreenController(),
          child: const SplashScreen(),
        ),
        settings: const RouteSettings(name: RoutesConstants.splashScreen),
      );
    } else {
      return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('route $screenName is not found'),
            ),
          );
        },
      );
    }
  }
}
