import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Comprehensive color configuration for Erply themes
///
/// Provides a flexible and extensible color system with predefined
/// light and dark themes, and support for custom color configurations.
class ErplyColorConfig {
  // used in theme
  final Color theme,
      background,
      surface,
      success,
      warning,
      error,
      icon,
      hint,
      divider,
      grayDarkest,
      grayDarker,
      grayDark,
      gray,
      grayLight,
      grayLighter,
      grayLightest,
      secondaryDark,
      secondaryDarker,
      secondary,
      secondaryLight,
      primaryDarker,
      primaryDark,
      primary,
      primaryLight,
      tertiaryDark,
      tertiary,
      tertiaryLight,

      // on colors used for text
      onTheme,
      onBackground,
      onSurface,
      onPrimary,
      onSecondary,
      onTertiary,
      onSuccess,
      onWarning,
      onError,

      // text
      displayText,
      subtitleText,
      captionText,
      bodyText,
      bodySecondaryText;

  /// Constructs an [ErplyColorConfig] with required and optional color parameters
  ///
  /// Provides sensible defaults for optional color parameters
  const ErplyColorConfig(
      {required this.theme,
      required this.background,
      required this.surface,
      required this.success,
      required this.warning,
      required this.error,
      required this.icon,
      required this.hint,
      required this.divider,
      required this.grayDarkest,
      required this.grayDarker,
      required this.grayDark,
      required this.gray,
      required this.grayLight,
      required this.grayLighter,
      required this.grayLightest,
      required this.secondaryDark,
      required this.secondaryDarker,
      required this.secondary,
      required this.secondaryLight,
      required this.primaryDarker,
      required this.primaryDark,
      required this.primary,
      required this.primaryLight,
      required this.tertiaryDark,
      required this.tertiary,
      required this.tertiaryLight,
      required this.onTheme,
      required this.onBackground,
      required this.onSurface,
      required this.onPrimary,
      required this.onSecondary,
      required this.onTertiary,
      required this.onSuccess,
      required this.onWarning,
      required this.onError,
      required this.displayText,
      required this.subtitleText,
      required this.captionText,
      required this.bodyText,
      required this.bodySecondaryText});

  /// Predefined light color configuration
  static const ErplyColorConfig defaultLight = ErplyColorConfig(
    theme: Color(0xffffffff),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    icon: Color(0xFF585757),
    hint: Color(0xFF727981),
    divider: Color(0xFFEBECEE),
    grayDarkest: Color(0xFF1C1C1C),
    grayDarker: Color(0xFF585757),
    grayDark: Color(0xFF969696),
    gray: Color(0xFFB3B3B3),
    grayLight: Color(0xFFEBECEE),
    grayLighter: Color(0xFFEBECEE),
    grayLightest: Color(0xFFEEEFF1),
    secondaryLight: Color(0xFF32B17E),
    secondary: Color(0xFF2FAA79),
    secondaryDark: Color(0xFF0E9B62),
    secondaryDarker: Color(0xFF088D57),
    primaryLight: Color(0xFF0d5cf5),
    primary: Color(0xFF0737A0),
    primaryDark: Color(0xFF052C80),
    primaryDarker: Color(0xFF042160),
    tertiaryLight: Color(0xFFFFAFAF),
    tertiary: Color(0xFFFF6262),
    tertiaryDark: Color(0xFFFF4949),
    success: Color(0xFF2FAA79),
    warning: Color(0xFFF2C94C),
    error: Color(0xFFFF6262),
    onTheme: Color(0xFF000000),
    onBackground: Color(0xFF1C2126),
    onSurface: Color(0xFF1C2126),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onTertiary: Color(0xFFFFFFFF),
    onSuccess: Color(0xFFFFFFFF),
    onWarning: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),
    displayText: Color(0xFF1C2126),
    subtitleText: Color(0xFF727981),
    captionText: Color(0xFF727981),
    bodyText: Color(0xFF1C2126),
    bodySecondaryText: Color(0xFF34495E),
  );

  /// Predefined dark color configuration
  static const ErplyColorConfig defaultDark = ErplyColorConfig(
    theme: Color(0xFF000000),
    background: Color(0xFF1B1C21),
    surface: Color(0xFF1F2026),
    icon: Color(0xFFD6D6D6),
    hint: Color(0xFF939BA5),
    divider: Color(0xFF31333D),
    grayDarkest: Color(0xFFEEEFF1),
    grayDarker: Color(0xFF25272B),
    grayDark: Color(0xFF585757),
    gray: Color(0xFF585858),
    grayLight: Color(0xFF2D2F38),
    grayLighter: Color(0xFF292929),
    grayLightest: Color(0xFF1D1D1D),
    secondaryLight: Color(0xFF088D57),
    secondary: Color(0xFF0E9B62),
    secondaryDark: Color(0xFF2FAA79),
    secondaryDarker: Color(0xFF32B17E),
    primaryLight: Color(0xFF052C80),
    primary: Color(0xFF0737A0),
    primaryDark: Color(0xFF0d5cf5),
    primaryDarker: Color(0xFF0d5cf5),
    tertiaryLight: Color(0xFFFF4949),
    tertiary: Color(0xFFFF6262),
    tertiaryDark: Color(0xFFFFAFAF),
    success: Color(0xFF2FAA79),
    warning: Color(0xFFF2C94C),
    error: Color(0xFFFF6262),
    onTheme: Color(0xFFFFFFFF),
    onBackground: Color(0xFFE4E6EB),
    onSurface: Color(0xFFE4E6EB),
    onPrimary: Color(0xFFEEEEEE),
    onSecondary: Color(0xFFEEEEEE),
    onTertiary: Color(0xFFEEEEEE),
    onSuccess: Color(0xFFEEEEEE),
    onWarning: Color(0xFFEEEEEE),
    onError: Color(0xFFEEEEEE),
    displayText: Color(0xFFEEEEEE),
    subtitleText: Color(0xFFE4E6EB),
    captionText: Color(0xFFE4E6EB),
    bodyText: Color(0xFFEEEEEE),
    bodySecondaryText: Color(0xFFEEEEEE),
  );

  /// Converts the color configuration to a [ColorScheme]
  ///
  /// Useful for creating Material Design themes
  ColorScheme toColorScheme() {
    return ColorScheme.fromSeed(
      seedColor: primary,
      surface: surface,
      primary: primary,
      secondary: secondary,
      onSurface: onSurface,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onError: onError,
      tertiary: tertiary,
      error: error,
      outline: divider,
      outlineVariant: divider,
      onTertiary: onTertiary,
      onTertiaryContainer: onTertiary,
    );
  }

  /// Utility method to lighten a color
  static int getLightenColorComponentValue(
    double componentValue, {
    double amount = 0.2,
  }) {
    final v = (componentValue * 255).toInt();
    return v + ((255 - v) * amount).round();
  }

  static int getDarkenenColorComponentValue(
    double componentValue, {
    double amount = 0.2,
  }) {
    final v = (componentValue * 255).toInt();
    return v - (v * amount).round();
  }

  static Color lightenColor(Color color, {double amount = 0.2}) {
    return Color.fromARGB(
      (color.a * 255).toInt(),
      getLightenColorComponentValue(color.r, amount: amount),
      getLightenColorComponentValue(color.g, amount: amount),
      getLightenColorComponentValue(color.b, amount: amount),
    );
  }

  /// Utility method to darken a color
  static Color darkenColor(Color color, {double amount = 0.2}) {
    return Color.fromARGB(
      (color.a * 255).toInt(),
      getDarkenenColorComponentValue(color.r, amount: amount),
      getDarkenenColorComponentValue(color.g, amount: amount),
      getDarkenenColorComponentValue(color.b, amount: amount),
    );
  }

  /// Utility method to get a contrasting text color
  static Color getContrastColor(Color color) {
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  /// Returns the brightness of a color
  static Brightness getColorBrightness(Color color) {
    return color.computeLuminance() > 0.5 ? Brightness.light : Brightness.dark;
  }

  // SystemUiOverlayStyle
  static SystemUiOverlayStyle getSystemUiOverlayStyle(Color color) {
    return getColorBrightness(color) == Brightness.light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
  }

  /// Create a copy of the color configuration with optional parameter overrides
  ErplyColorConfig copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? background,
    Color? surface,
    Color? onPrimary,
    Color? onSecondary,
    Color? onTertiary,
    Color? onError,
    Color? onBackground,
    Color? onSurface,
    Color? theme,
    Color? icon,
    Color? hint,
    Color? divider,
    Color? grayDarkest,
    Color? grayDarker,
    Color? grayDark,
    Color? gray,
    Color? grayLight,
    Color? grayLighter,
    Color? grayLightest,
    Color? secondaryDark,
    Color? secondaryDarker,
    Color? secondaryLight,
    Color? primaryDarker,
    Color? primaryDark,
    Color? primaryLight,
    Color? tertiaryDark,
    Color? tertiaryLight,
    Color? success,
    Color? warning,
    Color? onTheme,
    Color? onSuccess,
    Color? onWarning,
    Color? displayText,
    Color? subtitleText,
    Color? captionText,
    Color? bodyText,
    Color? bodySecondaryText,
  }) {
    return ErplyColorConfig(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onTertiary: onTertiary ?? this.onTertiary,
      onError: onError ?? this.onError,
      onBackground: onBackground ?? this.onBackground,
      onSurface: onSurface ?? this.onSurface,
      theme: theme ?? this.theme,
      icon: icon ?? this.icon,
      hint: hint ?? this.hint,
      divider: divider ?? this.divider,
      grayDarkest: grayDarkest ?? this.grayDarkest,
      grayDarker: grayDarker ?? this.grayDarker,
      grayDark: grayDark ?? this.grayDark,
      gray: gray ?? this.gray,
      grayLight: grayLight ?? this.grayLight,
      grayLighter: grayLighter ?? this.grayLighter,
      grayLightest: grayLightest ?? this.grayLightest,
      secondaryDark: secondaryDark ?? this.secondaryDark,
      secondaryDarker: secondaryDarker ?? this.secondaryDarker,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      primaryDarker: primaryDarker ?? this.primaryDarker,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      tertiaryDark: tertiaryDark ?? this.tertiaryDark,
      tertiaryLight: tertiaryLight ?? this.tertiaryLight,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      onTheme: onTheme ?? this.onTheme,
      onSuccess: onSuccess ?? this.onSuccess,
      onWarning: onWarning ?? this.onWarning,
      displayText: displayText ?? this.displayText,
      subtitleText: subtitleText ?? this.subtitleText,
      captionText: captionText ?? this.captionText,
      bodyText: bodyText ?? this.bodyText,
      bodySecondaryText: bodySecondaryText ?? this.bodySecondaryText,
    );
  }
}
