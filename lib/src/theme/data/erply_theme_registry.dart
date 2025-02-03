import '../models/erply_theme_data.dart';

/// Manages registration and retrieval of custom themes
class ErplyThemeRegistry {
  static final Map<String, ErplyThemeData> _themes = {
    'Default': defaultErplyTheme,
  };

  /// Register a new theme
  static void registerTheme(ErplyThemeData theme) {
    _themes[theme.name] = theme;
  }

  /// Register a new theme
  static void registerThemes(List<ErplyThemeData> themes) {
    for (final theme in themes) {
      _themes[theme.name] = theme;
    }
  }

  /// Get a theme by name
  static ErplyThemeData? getTheme(String name) {
    return _themes[name];
  }

  /// List all registered theme names
  static List<String> getThemeNames() {
    return _themes.keys.toList();
  }

  /// List all registered themes
  static List<ErplyThemeData> getThemes() {
    return _themes.values.toList();
  }

  /// Check if a theme exists
  static bool hasTheme(String name) {
    return _themes.containsKey(name);
  }
}
