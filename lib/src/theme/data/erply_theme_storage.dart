import 'package:shared_preferences/shared_preferences.dart';

/// Manages persistent storage of theme preferences
class ErplyThemeStorage {
  static const String _themeNameKey = 'erply_current_theme_name';
  static const String _themeVariantKey = 'erply_current_theme_variant';

  /// Save the current theme name
  static Future<void> saveThemeName(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeNameKey, themeName);
  }

  /// Save the current theme variant
  static Future<void> saveThemeVariant(String variant) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeVariantKey, variant);
  }

  /// Retrieve the saved theme name
  static Future<String?> getThemeName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeNameKey);
  }

  /// Retrieve the saved theme variant
  static Future<String?> getThemeVariant() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeVariantKey);
  }

  /// Clear saved theme preferences
  static Future<void> clearThemePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_themeNameKey);
    await prefs.remove(_themeVariantKey);
  }
}
