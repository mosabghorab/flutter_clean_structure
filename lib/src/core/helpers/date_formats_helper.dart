import 'package:intl/intl.dart';

abstract class DateFormatsHelper {
  // format date.
  static String formatDate(
    DateTime dateTime, {
    bool withTime = false,
  }) {
    if (withTime) {
      return DateFormat('yyyy/MM/dd hh:mm a').format(dateTime);
    } else {
      return DateFormat('yyyy/MM/dd').format(dateTime);
    }
  }

  // format time.
  static String formatTime(
    DateTime dateTime, {
    bool withSeconds = false,
  }) {
    return withSeconds
        ? DateFormat('hh:mm:ss').format(dateTime)
        : DateFormat('hh:mm').format(dateTime);
  }
}
