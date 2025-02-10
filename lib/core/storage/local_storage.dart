import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String localeKey = 'locale';

  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  Future<void> setLocale(String languageCode) async {
    await _prefs.setString(localeKey, languageCode);
  }

  String getLocale() {
    return _prefs.getString(localeKey) ?? 'en';
  }
}
