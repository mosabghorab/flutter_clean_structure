import 'package:flutter/foundation.dart';

abstract class LogsHelper {
  // log failed.
  static void logFailed({
    required String message,
    required String location,
  }) {
    debugPrint('''
[Failed]
[-----------------------------------------  [$location] ------------------------------------------
$message
 -----------------------------------------  [$location] ------------------------------------------]
    ''');
  }

  // log error.
  static void logError({
    required dynamic error,
    required String location,
  }) {
    debugPrint('''
[Error]
[-----------------------------------------  [$location] ------------------------------------------
${error.toString()}
 -----------------------------------------  [$location] ------------------------------------------]
    ''');
  }

  // log success.
  static void logSuccess({
    required String data,
    required String location,
  }) {
    debugPrint('''
[Success]
[-----------------------------------------  [$location] ------------------------------------------
$data
 -----------------------------------------  [$location] ------------------------------------------]
    ''');
  }
}
