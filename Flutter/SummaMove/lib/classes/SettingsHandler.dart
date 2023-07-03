import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui';

class SettingsHandler extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.system;
  Locale locale = window.locale;

  static final SettingsHandler _instance = SettingsHandler._internal();

  factory SettingsHandler() {
    return _instance;
  }

  SettingsHandler._internal();

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
  ThemeMode getThemeMode() => themeMode;

  void setLanguage(String lang) {
    locale = Locale.fromSubtags(countryCode: lang);
    notifyListeners();
  }
  Locale getLanguage() => locale;
}