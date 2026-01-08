import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyThemeMode = 'theme_mode';

  static Future<void> saveThemeMode(String themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, themeMode);
  }

  static Future<String?> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyThemeMode);
  }
}
