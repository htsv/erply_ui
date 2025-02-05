// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:erply_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../core/colors/models/erply_color_config.dart';
import '../../core/typography/models/erply_typography_config.dart';

/// Abstract base class for defining Erply themes
class ErplyThemeData {
  /// Name of the theme
  final String name;

  /// Typography configuration for the theme
  final ErplyTypographyConfig typographyConfig;

  // Light Typography Config
  ErplyTypographyConfig? _lightTypographyConfig;
  // Dark Typography Config
  ErplyTypographyConfig? _darkTypographyConfig;

  ErplyTypographyConfig getCurrentTypographyConfig(ErplyThemeVariant v) {
    return (v == ErplyThemeVariant.light
            ? _lightTypographyConfig
            : _darkTypographyConfig) ??
        typographyConfig;
  }

  ErplyColorConfig getCurrentColorConfig(ErplyThemeVariant v) {
    return v == ErplyThemeVariant.dark ? darkColorConfig : lightColorConfig;
  }

  /// Color configuration for light theme
  final ErplyColorConfig lightColorConfig;

  /// Color configuration for dark theme
  final ErplyColorConfig darkColorConfig;

  /// Constructor for ErplyThemeData
  ///
  /// Requires both light and dark color configurations
  ErplyThemeData({
    required this.name,
    required this.lightColorConfig,
    required this.darkColorConfig,
    ErplyTypographyConfig? typographyConfig,
  }) : typographyConfig =
            typographyConfig ?? ErplyTypographyConfig.defaultTypography;

  /// Create light theme
  ThemeData createLightTheme() {
    // Create a typography config with light theme colors
    _lightTypographyConfig = ErplyTypographyConfig.generate(
      displayFontFamily: typographyConfig.fontFamily,
      bodyFontFamily: typographyConfig.fontFamily,
      displayColor: lightColorConfig.displayText,
      bodyColor: lightColorConfig.bodyText,
    );

    return buildTheme(
      ErplyThemeVariant.light,
      lightColorConfig,
      _lightTypographyConfig!,
    );
  }

  /// Create dark theme
  ThemeData createDarkTheme() {
    // Create a typography config with dark theme colors
    _darkTypographyConfig = ErplyTypographyConfig.generate(
      displayFontFamily: typographyConfig.fontFamily,
      bodyFontFamily: typographyConfig.fontFamily,
      displayColor: darkColorConfig.displayText,
      bodyColor: darkColorConfig.bodyText,
    );

    return buildTheme(
      ErplyThemeVariant.dark,
      darkColorConfig,
      _darkTypographyConfig!,
    );
  }

  ThemeData buildTheme(
    ErplyThemeVariant themeVariant,
    ErplyColorConfig colorConfig,
    ErplyTypographyConfig typographyConfig,
  ) {
    ThemeData baseTheme;
    final themeMode = themeVariant.toThemeMode();

    if (themeMode == ThemeMode.light) {
      baseTheme = ThemeData.light();
    } else {
      baseTheme = ThemeData.dark();
    }

    return baseTheme.copyWith(
      brightness: ErplyColorConfig.getColorBrightness(colorConfig.primary),
      extensions: [],
      // Color Scheme
      colorScheme: colorConfig.toColorScheme(),
      // Colors
      scaffoldBackgroundColor: colorConfig.background,
      canvasColor: colorConfig.surface,
      cardColor: colorConfig.surface,
      dialogBackgroundColor: colorConfig.surface,
      dividerColor: colorConfig.divider,
      hintColor: colorConfig.hint,
      primaryColor: colorConfig.primary,
      primaryColorLight: colorConfig.primaryLight,
      primaryColorDark: colorConfig.primaryDark,
      // Theme
      appBarTheme: baseTheme.appBarTheme.copyWith(
        systemOverlayStyle: ErplyColorConfig.getSystemUiOverlayStyle(
          colorConfig.background,
        ),
        elevation: 0,
        color: colorConfig.background,
        surfaceTintColor: Colors.transparent,
        iconTheme: baseTheme.iconTheme.copyWith(
          color: colorConfig.onTheme,
        ),
        titleTextStyle: typographyConfig.displaySmall.toTextStyle().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colorConfig.displayText,
            ),
        toolbarTextStyle: typographyConfig.bodyMedium.toTextStyle().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: colorConfig.displayText,
            ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorConfig.primary.withValues(alpha: 0.1),
        elevation: 2,
        selectedIconTheme: IconThemeData(color: colorConfig.primary),
        selectedItemColor: colorConfig.primary.withValues(alpha: 1),
        selectedLabelStyle: TextStyle(
          fontFamily: typographyConfig.fontFamily,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        showSelectedLabels: true,
        unselectedIconTheme: IconThemeData(
          color: colorConfig.primary.withValues(alpha: 0.5),
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: typographyConfig.fontFamily,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        unselectedItemColor: colorConfig.primary.withValues(alpha: 0.5),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
      ),
      bottomSheetTheme: baseTheme.bottomSheetTheme.copyWith(
        constraints: const BoxConstraints(),
        modalBackgroundColor: colorConfig.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
      ),
      buttonTheme: baseTheme.buttonTheme.copyWith(
        buttonColor: colorConfig.primary,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textTheme: ButtonTextTheme.primary,
      ),
      cardTheme: baseTheme.cardTheme.copyWith(
        elevation: 0,
        color: colorConfig.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      chipTheme: ChipThemeData.fromDefaults(
        primaryColor: colorConfig.primary,
        secondaryColor: colorConfig.primary,
        labelStyle: typographyConfig.bodyLarge.toTextStyle().copyWith(
              color: colorConfig.onSurface,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
      ),
      dialogTheme: baseTheme.dialogTheme.copyWith(
        backgroundColor: colorConfig.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      dividerTheme: baseTheme.dividerTheme.copyWith(
        thickness: 1,
        color: colorConfig.divider,
        space: 0,
      ),
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        // fillColor: colorConfig.surface,
        // focusColor: colorConfig.surface,
        // hoverColor: colorConfig.surface,
        // filled: true,
        // isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: colorConfig.divider,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: colorConfig.divider,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: colorConfig.divider,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
      ),
      iconTheme: baseTheme.iconTheme.copyWith(
        color: colorConfig.icon,
      ),
      popupMenuTheme: baseTheme.popupMenuTheme.copyWith(
        color: colorConfig.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      primaryIconTheme: baseTheme.iconTheme.copyWith(
        color: colorConfig.onPrimary,
      ),
      textTheme: typographyConfig.toTextTheme().apply(
            fontFamily: typographyConfig.fontFamily,
            displayColor: colorConfig.displayText,
            bodyColor: colorConfig.bodyText,
          ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: colorConfig.background,
      ),
      tabBarTheme: baseTheme.tabBarTheme.copyWith(
        labelColor: colorConfig.grayDarker,
        labelStyle: typographyConfig.labelMedium.toTextStyle(),
        unselectedLabelColor: colorConfig.gray,
        unselectedLabelStyle: typographyConfig.labelMedium.toTextStyle(),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colorConfig.success,
              width: 4,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorConfig.onPrimary,
          backgroundColor: colorConfig.primary,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: TextStyle(
            color: colorConfig.onPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorConfig.onPrimary,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: TextStyle(
            color: colorConfig.onPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 1.33,
          ),
        ),
      ),
      visualDensity: VisualDensity.compact,
      switchTheme: SwitchThemeData(
        thumbColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            if (themeMode == ThemeMode.light) {
              return colorConfig.primary;
            }
            return colorConfig.primaryDark;
          }
          return null;
        }),
        trackColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            if (themeMode == ThemeMode.light) {
              return colorConfig.primary;
            }
            return colorConfig.primaryDark;
          }
          return null;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return colorConfig.onTheme;
          },
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              if (themeMode == ThemeMode.light) {
                return colorConfig.primary;
              }
              return colorConfig.primaryDark;
            }
            return null;
          },
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        splashRadius: 0,
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return colorConfig.background;
            }
            if (states.contains(WidgetState.selected)) {
              return themeMode == ThemeMode.light
                  ? colorConfig.primary
                  : colorConfig.primaryDark;
            }
            return colorConfig.background;
          },
        ),
        checkColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return themeMode == ThemeMode.light
                ? colorConfig.onPrimary
                : colorConfig.onPrimary;
          },
        ),
        // side: BorderSide.none,
        // shape: const RoundedRectangleBorder(
        //   side: BorderSide.none,
        // ),
      ),
    );
  }

  /// Create a copy of the theme with optional modifications
  ErplyThemeData copyWith({
    String? name,
    ErplyTypographyConfig? typographyConfig,
    ErplyColorConfig? lightColorConfig,
    ErplyColorConfig? darkColorConfig,
  }) {
    return ErplyThemeData(
      name: name ?? this.name,
      typographyConfig: typographyConfig ?? this.typographyConfig,
      lightColorConfig: lightColorConfig ?? this.lightColorConfig,
      darkColorConfig: darkColorConfig ?? this.darkColorConfig,
    );
  }
}

final defaultErplyTheme = ErplyThemeData(
  name: 'Default',
  lightColorConfig: ErplyColorConfig.defaultLight,
  darkColorConfig: ErplyColorConfig.defaultDark,
  typographyConfig: ErplyTypographyConfig.defaultTypography,
);
