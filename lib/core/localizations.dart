import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  late Locale locale;
  late Map<String, String> _valueText;

  static const List<String> _supportedLanguages = [
    'en',
    'tr',
  ];

  static const Map<String, String> _supportedLanguages2 = {
    'en': "English",
    'tr': "Türkçe",
  };

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static bool isSupported(String locale) {
    return _supportedLanguages.any((element) => locale.contains(element));
  }

  static String getSupportedLocaleCode(String locale) {
    return _supportedLanguages
        .where((element) => locale.contains(element))
        .first;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  Future loadTranslateFile() async {
    String langFile =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    Map<String, dynamic> json = jsonDecode(langFile);
    _valueText = json.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslate(String key) {
    if (_valueText.containsKey(key)) {
      return _valueText[key]!;
    } else {
      return "-- LANG $key--";
    }
  }

  Map<String, String> getSupportedLanguages() {
    return _supportedLanguages2;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  static const List<String> _supportedLanguages = [
    'en',
    'tr',
  ];

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return _supportedLanguages.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.loadTranslateFile();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant AppLocalizationsDelegate old) => false;
}

Locale? localeResolutionCallback(
    Locale? deviceLocale, Iterable<Locale> supportedLocales) {
  // return deviceLocale != null &&
  //         ['en', 'ar', 'tr', 'fa', 'fr', 'es']
  //             .contains(deviceLocale.languageCode)
  //     ? deviceLocale
  //     : supportedLocales.first;
  for (var supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == deviceLocale?.languageCode &&
        supportedLocale.countryCode == deviceLocale?.countryCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}
