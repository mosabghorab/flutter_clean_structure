import 'package:flutter/material.dart';
import 'package:new_streamline/src/core/app_shared_data.dart';

// this class is responsible for navigation management.
abstract class N {
  // init.
  static void init() {
    AppSharedData.navigationKey = GlobalKey();
  }

  // same of push named.
  static Future<dynamic> toNamed(String routeName, {Object? arguments}) async {
    return AppSharedData.navigationKey!.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  // same of push and remove until named.
  static Future<dynamic> offAllNamed(String routeName,
      {Object? arguments}) async {
    return AppSharedData.navigationKey!.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  // same of push.
  static Future<T?> to<T extends Object?>(Route<T>? route) {
    return AppSharedData.navigationKey!.currentState!.push(route!);
  }

  // same of pop.
  static void back<T extends Object>([T? result]) {
    AppSharedData.navigationKey!.currentState!.pop(result);
  }

  // pop to the first route in the stack.
  static void backAll<T extends Object>([T? result]) {
    while (AppSharedData.navigationKey!.currentState!.canPop()) {
      AppSharedData.navigationKey!.currentState!.pop(result);
    }
  }

  // same of pop until.
  static void backUntil(RoutePredicate predicate) {
    AppSharedData.navigationKey!.currentState!.popUntil(predicate);
  }
}
