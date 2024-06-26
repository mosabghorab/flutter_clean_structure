import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_streamline/src/core/app_shared_data.dart';
import 'package:new_streamline/src/core/styles/colors_constant.dart';

extension ThemingAndTranslation on String {
  Color get th => AppSharedData.appTheming[this] ?? ColorsConstants.black;

  String get tr => AppSharedData.appLocalization.translate(this) ?? this;
}

extension Conversion on String {
  // to num.
  num toNum() => num.tryParse(this) ?? 0;

  // to int.
  int toInt() => int.tryParse(this) ?? 0;

  // to double.
  double toDouble() => double.tryParse(this) ?? 0;
}

extension Parsable on Response {
  //  is parsable.
  bool isParsable() =>
      data['status'] != null && data['code'] != null && data['message'] != null;
}
