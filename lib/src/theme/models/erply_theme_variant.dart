import 'package:flutter/material.dart';

/// Enumeration of theme variants
enum ErplyThemeVariant {
  /// Light theme variant
  light,

  /// Dark theme variant
  dark;

  /// Toggle between light and dark variants
  ErplyThemeVariant toggle() {
    return this == light ? dark : light;
  }

  /// Check if the current variant is light
  bool get isLight => this == light;

  /// Check if the current variant is dark
  bool get isDark => this == dark;

  /// Convert to a ThemeMode
  ThemeMode toThemeMode() {
    return this == light ? ThemeMode.light : ThemeMode.dark;
  }

  /// Convert to a Brightness
  Brightness toBrightness() {
    return this == light ? Brightness.light : Brightness.dark;
  }
}
