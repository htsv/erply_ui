import 'package:flutter/material.dart';

import '../../../erply_ui.dart';

/// Represents the current state of the Erply theme system
class ErplyThemeState {
  /// The current theme variant (light/dark)
  final ErplyThemeVariant variant;

  /// The current theme
  final ErplyThemeData theme;

  /// Creates a new theme state
  const ErplyThemeState({
    required this.variant,
    required this.theme,
  });

  /// Create a copy of this state with optional parameter overrides
  ErplyThemeState copyWith({
    ErplyThemeVariant? variant,
    ErplyThemeData? theme,
  }) {
    return ErplyThemeState(
      variant: variant ?? this.variant,
      theme: theme ?? this.theme,
    );
  }

  /// Get the current theme variant as a ThemeMode
  ThemeMode get themeMode {
    return variant == ErplyThemeVariant.dark ? ThemeMode.dark : ThemeMode.light;
  }

  /// Get the current color config
  ErplyColorConfig get currentColorConfig {
    return theme.getCurrentColorConfig(variant);
  }

  /// Get the current color config
  ErplyTypographyConfig get currentTypographyConfig {
    return theme.getCurrentTypographyConfig(variant);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErplyThemeState &&
          runtimeType == other.runtimeType &&
          theme.name == other.theme.name &&
          variant == other.variant;

  @override
  int get hashCode => theme.name.hashCode ^ variant.hashCode;

  @override
  String toString() =>
      'ErplyThemeState(theme: ${theme.name}, variant: $variant)';
}

final defaultErplyThemeState = ErplyThemeState(
  variant: ErplyThemeVariant.light,
  theme: defaultErplyTheme,
);
