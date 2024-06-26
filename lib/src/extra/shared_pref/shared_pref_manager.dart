import 'dart:async';

import 'package:new_streamline/src/core/constants.dart';
import 'package:new_streamline/src/extra/shared_pref/shared_pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static late SharedPreferences _sharedPreferences;

  // private constructor.
  SharedPrefManager._();

  // init.
  static Future<SharedPrefManager> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return SharedPrefManager._();
  }

  /////////////////////////////////////////////////////////////////////////////////

  // get locale.
  String getLocale() {
    return _sharedPreferences.getString(SharedPrefsConstants.localeKey) ??
        Constants.localeDefaultValue;
  }

  // set locale.
  Future<void> setLocale(String locale) async {
    await _sharedPreferences.setString(SharedPrefsConstants.localeKey, locale);
  }

  // get user.
  // User? getUser() {
  //   String? userJson =
  //       _sharedPreferences.getString(SharedPrefsConstants.sharedPreferencesUserData);
  //   if (userJson == null) return null;
  //   return SharedData.currentUser = userFromStringJson(userJson);
  // }

  // set user.
  // Future<void> setUser(User user) async {
  //   SharedData.currentUser = user;
  //   await _sharedPreferences!.setString(
  //     Constants.sharedPreferencesUserData,
  //     userToStringJson(user),
  //   );
  //   // re init api to get the user auth token.
  //   Api.init();
  // }

  // set is notifications enabled.
  // Future<void> setIsNotificationsEnabled(bool isNotificationsEnabled) async {
  //   await _sharedPreferences!.setBool(
  //       Constants.sharedPreferencesIsNotificationEnabled,
  //       isNotificationsEnabled);
  // }

  // is notifications enabled.
  // bool isNotificationsEnabled() {
  //   return _sharedPreferences!
  //           .getBool(Constants.sharedPreferencesIsNotificationEnabled) ??
  //       Constants.sharedPreferencesIsNotificationEnabledDefaultValue;
  // }

  // set is dark mode enabled.
  Future<void> setIsDarkModeEnabled(bool isDarkModeEnabled) async {
    await _sharedPreferences.setBool(
        SharedPrefsConstants.isDarkModeEnabledKey, isDarkModeEnabled);
  }

  //||...  is dark mode enabled ...||
  bool isDarkModeEnabled() {
    return _sharedPreferences
            .getBool(SharedPrefsConstants.isDarkModeEnabledKey) ??
        Constants.isDarkModeEnabledDefaultValue;
  }

  // clear.
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }

// clear user.
// Future<void> clearUserData() async {
//   await _sharedPreferences.remove(SharedPrefsConstants.currentUser);
//   SharedData.currentUser = null;
// }
}
