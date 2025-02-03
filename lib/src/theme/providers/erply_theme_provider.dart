import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/erply_theme_data.dart';
import '../data/erply_theme_registry.dart';
import '../data/erply_theme_storage.dart';
import '../models/erply_theme_state.dart';
import '../models/erply_theme_variant.dart';

/// Manages theme state and provides theme-related functionality
class ErplyThemeNotifier extends StateNotifier<ErplyThemeState> {
  ErplyThemeNotifier() : super(defaultErplyThemeState) {
    _initializeTheme();
  }

  /// Set a specific theme with variant
  Future<void> setTheme(
    ErplyThemeData theme, {
    ErplyThemeVariant variant = ErplyThemeVariant.light,
  }) async {
    // Ensure theme is registered
    if (!ErplyThemeRegistry.hasTheme(theme.name)) {
      ErplyThemeRegistry.registerTheme(theme);
    }

    state = ErplyThemeState(
      theme: theme,
      variant: variant,
    );

    // Persist theme selection
    await ErplyThemeStorage.saveThemeName(theme.name);
    await ErplyThemeStorage.saveThemeVariant(
      variant == ErplyThemeVariant.dark ? 'dark' : 'light',
    );
  }

  /// Set theme by name with optional variant
  Future<void> setThemeByName(
    String name, {
    ErplyThemeVariant variant = ErplyThemeVariant.light,
  }) async {
    final theme = ErplyThemeRegistry.getTheme(name);

    if (theme == null) {
      throw ArgumentError(
          'Theme "$name" is not registered. Register it first using ErplyThemeRegistry.registerTheme()');
    }

    await setTheme(theme, variant: variant);
  }

  /// Initialize theme from persistent storage
  Future<void> _initializeTheme() async {
    try {
      // Retrieve saved theme name
      final savedThemeName = await ErplyThemeStorage.getThemeName();
      final savedThemeVariant = await ErplyThemeStorage.getThemeVariant();

      // If no saved theme, use default
      if (savedThemeName == null) {
        state = defaultErplyThemeState;
        return;
      }

      // Try to get the saved theme
      final savedTheme = ErplyThemeRegistry.getTheme(savedThemeName);

      if (savedTheme == null) {
        // If saved theme is not found, fall back to default
        state = defaultErplyThemeState;
        await ErplyThemeStorage.clearThemePreferences();
        return;
      }

      // Set the saved theme
      state = ErplyThemeState(
        theme: savedTheme,
        variant: savedThemeVariant == 'dark'
            ? ErplyThemeVariant.dark
            : ErplyThemeVariant.light,
      );
    } catch (e) {
      // Fallback to default theme in case of any errors
      state = defaultErplyThemeState;
    }
  }

  void toggleThemeVariant() {
    final newVariant = state.variant == ErplyThemeVariant.light
        ? ErplyThemeVariant.dark
        : ErplyThemeVariant.light;

    state = state.copyWith(variant: newVariant);
  }
}

/// Provider for theme state management
final erplyThemeProvider =
    StateNotifierProvider<ErplyThemeNotifier, ErplyThemeState>((ref) {
  return ErplyThemeNotifier();
});
