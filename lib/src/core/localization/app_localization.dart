import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_streamline/src/core/app_shared_data.dart';
import 'package:new_streamline/src/core/constants.dart';

import 'locales/ar.dart';
import 'locales/en.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) =>
      Constants.supportedLocales.keys.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  late final Locale locale;
  late Map<String, String>? _localizedValues;
  static LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  AppLocalizations(this.locale) {
    AppSharedData.appLocalization = this;
    load();
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // load.
  void load() {
    switch (locale.languageCode) {
      case 'ar':
        _localizedValues = ar;
        break;
      case 'en':
        _localizedValues = en;
        break;
    }
  }

  // translate.
  String? translate(String key) {
    return _localizedValues![key];
  }
}
