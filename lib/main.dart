import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:new_streamline/src/core/app_shared_data.dart';
import 'package:new_streamline/src/core/di/dependency_injection.dart';
import 'package:new_streamline/src/core/routing/navigation_manager.dart';
import 'package:new_streamline/src/core/themeing/themes/dark.dart';
import 'package:new_streamline/src/core/themeing/themes/light.dart';
import 'package:new_streamline/src/extra/shared_pref/shared_pref_manager.dart';
import 'package:new_streamline/src/my_app.dart';
import 'package:new_streamline/src/my_app_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  await beforeLaunching();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => ChangeNotifierProvider<MyAppController>(
        create: (_) => MyAppController(),
        child: const MyApp(),
      ),
    ),
  );
}

// before launching.
Future<void> beforeLaunching() async {
  WidgetsFlutterBinding.ensureInitialized();
  N.init();
  await DependencyInjection.init();
  // setup app theming.
  AppSharedData.appTheming =
      DependencyInjection.get<SharedPrefManager>().isDarkModeEnabled()
          ? dark
          : light;
}
