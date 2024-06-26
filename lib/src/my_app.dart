import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_streamline/src/core/app_shared_data.dart';
import 'package:new_streamline/src/core/constants.dart';
import 'package:new_streamline/src/core/di/dependency_injection.dart';
import 'package:new_streamline/src/core/localization/app_localization.dart';
import 'package:new_streamline/src/core/routing/router_manager.dart';
import 'package:new_streamline/src/core/routing/routes_constants.dart';
import 'package:new_streamline/src/core/themeing/theme_manager.dart';
import 'package:new_streamline/src/extra/shared_pref/shared_pref_manager.dart';
import 'package:provider/provider.dart';

import 'my_app_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPrefManager sharedPrefManager =
        DependencyInjection.get<SharedPrefManager>();
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    return Selector<MyAppController, bool>(
      selector: (_, value) => value.nApp,
      builder: (_, nApp, __) => ScreenUtilInit(
        designSize: const Size(1024, 768),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.light(),
          darkTheme: ThemeManager.dark(),
          themeMode: sharedPrefManager.isDarkModeEnabled()
              ? ThemeMode.dark
              : ThemeMode.light,
          locale: Locale(sharedPrefManager.getLocale()),
          builder: DevicePreview.appBuilder,
          supportedLocales:
              Constants.supportedLocales.keys.map((locale) => Locale(locale)),
          navigatorKey: AppSharedData.navigationKey,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: Constants.appName,
          onGenerateRoute: RouterManager.onGenerateRoute,
          initialRoute: RoutesConstants.splashScreen,
        ),
      ),
    );
  }
}
