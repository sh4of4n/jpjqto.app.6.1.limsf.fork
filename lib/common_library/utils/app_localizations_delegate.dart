import 'dart:async';
import 'package:flutter/material.dart';
import 'app_localizations.dart';
import 'application.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final Locale? newLocale;

  const AppLocalizationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return application.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return true;
  }
}
