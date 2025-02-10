import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String themeKey = 'theme_mode';
  static const String localeKey = 'locale';

  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setString(themeKey, mode.toString());
  }

  ThemeMode getThemeMode() {
    final String? theme = _prefs.getString(themeKey);
    return theme != null
        ? ThemeMode.values.firstWhere((e) => e.toString() == theme,
            orElse: () => ThemeMode.system)
        : ThemeMode.system;
  }

  Future<void> setLocale(String languageCode) async {
    await _prefs.setString(localeKey, languageCode);
  }

  String getLocale() {
    return _prefs.getString(localeKey) ?? 'en';
  }
}
