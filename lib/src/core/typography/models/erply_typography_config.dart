import 'package:erply_ui/erply_ui.dart';
import 'package:flutter/material.dart';
import 'erply_font_config.dart';

/// Comprehensive typography configuration
class ErplyTypographyConfig {
  static const defaultFontFamily = 'packages/erply_ui/SFProDisplay';
  static const defaultColor = Colors.black87;

  final String fontFamily;

  /// Display styles
  final ErplyFontConfig displayLarge;
  final ErplyFontConfig displayMedium;
  final ErplyFontConfig displaySmall;

  /// Headline styles
  final ErplyFontConfig headlineLarge;
  final ErplyFontConfig headlineMedium;
  final ErplyFontConfig headlineSmall;

  /// Title styles
  final ErplyFontConfig titleLarge;
  final ErplyFontConfig titleMedium;
  final ErplyFontConfig titleSmall;

  /// Body styles
  final ErplyFontConfig bodyLarge;
  final ErplyFontConfig bodyMedium;
  final ErplyFontConfig bodySmall;

  /// Additional styles
  final ErplyFontConfig labelLarge;
  final ErplyFontConfig labelMedium;
  final ErplyFontConfig labelSmall;

  /// Caption and overline
  final ErplyFontConfig caption;
  final ErplyFontConfig overline;

  ErplyTypographyConfig({
    String? fontFamily,
    ErplyFontConfig? titleLarge,
    ErplyFontConfig? titleMedium,
    ErplyFontConfig? titleSmall,
    ErplyFontConfig? displayLarge,
    ErplyFontConfig? displayMedium,
    ErplyFontConfig? displaySmall,
    ErplyFontConfig? headlineLarge,
    ErplyFontConfig? headlineMedium,
    ErplyFontConfig? headlineSmall,
    ErplyFontConfig? bodyLarge,
    ErplyFontConfig? bodyMedium,
    ErplyFontConfig? bodySmall,
    ErplyFontConfig? labelLarge,
    ErplyFontConfig? labelMedium,
    ErplyFontConfig? labelSmall,
    ErplyFontConfig? caption,
    ErplyFontConfig? overline,
  })  : fontFamily = fontFamily ?? defaultFontFamily,
        displayLarge = displayLarge ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
        displayMedium = displayMedium ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.25,
            ),
        displaySmall = displaySmall ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
        headlineLarge = headlineLarge ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
        headlineMedium = headlineMedium ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
        headlineSmall = headlineSmall ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
        titleLarge = titleLarge ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
        titleMedium = titleMedium ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
        titleSmall = titleSmall ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
        bodyLarge = bodyLarge ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
        bodyMedium = bodyMedium ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
        bodySmall = bodySmall ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
        labelLarge = labelLarge ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
            ),
        labelMedium = labelMedium ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
        labelSmall = labelSmall ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
        caption = caption ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
        overline = overline ??
            ErplyFontConfig(
              fontFamily: fontFamily ?? defaultFontFamily,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            );

  /// Get ErplyTypographyConfig for a  given baseColor and scaleFactor
  static ErplyTypographyConfig generateWithTwoColorsAndFontFamily({
    Color? displayColor,
    Color? bodyColor,
    String? displayFontFamily,
    String? bodyFontFamily,
    double scaleFactor = 1.0,
  }) {
    return ErplyTypographyConfig(
      fontFamily: bodyFontFamily ?? defaultFontFamily,
      displayLarge: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 57 * scaleFactor,
        fontWeight: FontWeight.w600,
        // color: displayColor ?? defaultColor,
        height: 1.12,
      ),
      displayMedium: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 45 * scaleFactor,
        fontWeight: FontWeight.w700,
        // color: displayColor ?? defaultColor,
        height: 1.16,
      ),
      displaySmall: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 36 * scaleFactor,
        fontWeight: FontWeight.w700,
        height: 1.22,
        // color: displayColor ?? defaultColor,
      ),
      headlineLarge: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 32 * scaleFactor,
        fontWeight: FontWeight.w600,
        // color: displayColor ?? defaultColor,
        height: 1.25,
      ),
      headlineMedium: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 28 * scaleFactor,
        fontWeight: FontWeight.w700,
        // color: displayColor ?? defaultColor,
        height: 1.29,
      ),
      headlineSmall: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 24 * scaleFactor,
        fontWeight: FontWeight.w700,
        height: 1.33,
        // color: displayColor ?? defaultColor,
      ),
      titleLarge: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 22 * scaleFactor,
        fontWeight: FontWeight.w600,
        // color: displayColor ?? defaultColor,
        height: 1.27,
      ),
      titleMedium: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: displayColor ?? defaultColor,
        height: 1.50,
      ),
      titleSmall: ErplyFontConfig(
        fontFamily: displayFontFamily ?? defaultFontFamily,
        fontSize: 14 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: displayColor ?? defaultColor,
        height: 1.43,
      ),
      bodyLarge: ErplyFontConfig(
        fontFamily: bodyFontFamily ?? defaultFontFamily,
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: bodyColor ?? defaultColor,
        height: 1.50,
      ),
      bodyMedium: ErplyFontConfig(
        fontFamily: bodyFontFamily ?? defaultFontFamily,
        fontSize: 14 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: bodyColor ?? defaultColor,
        height: 1.50,
      ),
      bodySmall: ErplyFontConfig(
        fontFamily: bodyFontFamily ?? defaultFontFamily,
        fontSize: 12 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: bodyColor ?? defaultColor,
        height: 1.50,
      ),
      labelLarge: ErplyFontConfig(
        fontFamily: bodyFontFamily ?? defaultFontFamily,
        fontSize: 14 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: bodyColor ?? defaultColor,
        height: 1.43,
      ),
      labelMedium: ErplyFontConfig(
        fontFamily: bodyFontFamily ?? defaultFontFamily,
        fontSize: 12 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: bodyColor ?? defaultColor,
        height: 1.33,
      ),
      labelSmall: ErplyFontConfig(
        fontFamily: bodyFontFamily ?? defaultFontFamily,
        fontSize: 11 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: bodyColor ?? defaultColor,
        height: 1.45,
      ),
      caption: ErplyFontConfig(
        fontFamily: bodyFontFamily ?? defaultFontFamily,
        fontSize: 12 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: bodyColor ?? defaultColor,
        height: 1.33,
      ),
      overline: ErplyFontConfig(
        fontFamily: bodyFontFamily ?? defaultFontFamily,
        fontSize: 11 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: bodyColor ?? defaultColor,
        height: 1.45,
      ),
    );
  }

  /// Generate a new typography configuration
  static ErplyTypographyConfig generate({
    String? fontFamily,
    Color? baseColor,
    double scaleFactor = 1.0,
  }) {
    return ErplyTypographyConfig(
      fontFamily: fontFamily,
      displayLarge: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 32 * scaleFactor,
        fontWeight: FontWeight.bold,
        // color: baseColor ?? defaultColor,
        letterSpacing: -0.5,
      ),
      displayMedium: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 28 * scaleFactor,
        fontWeight: FontWeight.w600,
        // color: baseColor ?? defaultColor,
        letterSpacing: -0.25,
      ),
      displaySmall: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 24 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: baseColor ?? defaultColor,
      ),
      headlineLarge: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 22 * scaleFactor,
        fontWeight: FontWeight.w600,
        // color: baseColor ?? defaultColor,
      ),
      headlineMedium: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 20 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: baseColor ?? defaultColor,
      ),
      headlineSmall: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 18 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: baseColor ?? defaultColor,
      ),
      bodyLarge: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: baseColor ?? defaultColor,
        height: 1.5,
      ),
      bodyMedium: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 14 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: baseColor ?? defaultColor,
        height: 1.5,
      ),
      bodySmall: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 12 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: baseColor ?? defaultColor,
        height: 1.5,
      ),
      labelLarge: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 14 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: baseColor ?? defaultColor,
        letterSpacing: 0.1,
      ),
      labelMedium: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 12 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: baseColor ?? defaultColor,
        letterSpacing: 0.5,
      ),
      labelSmall: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 10 * scaleFactor,
        fontWeight: FontWeight.w500,
        // color: baseColor ?? defaultColor,
        letterSpacing: 0.5,
      ),
      caption: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 12 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: (baseColor ?? defaultColor).withValues(alpha: 0.7),
        height: 1.3,
      ),
      overline: ErplyFontConfig(
        fontFamily: fontFamily ?? defaultFontFamily,
        fontSize: 10 * scaleFactor,
        fontWeight: FontWeight.w400,
        // color: (baseColor ?? defaultColor).withValues(alpha: 0.6),
        letterSpacing: 1.5,
      ),
    );
  }

  /// Create a TextTheme from the typography configuration
  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: displayLarge.toTextStyle(),
      displayMedium: displayMedium.toTextStyle(),
      displaySmall: displaySmall.toTextStyle(),
      headlineLarge: headlineLarge.toTextStyle(),
      headlineMedium: headlineMedium.toTextStyle(),
      headlineSmall: headlineSmall.toTextStyle(),
      bodyLarge: bodyLarge.toTextStyle(),
      bodyMedium: bodyMedium.toTextStyle(),
      bodySmall: bodySmall.toTextStyle(),
    );
  }

  /// Create a copy of the typography configuration with optional overrides
  ErplyTypographyConfig copyWith({
    String? fontFamily,
    ErplyFontConfig? displayLarge,
    ErplyFontConfig? displayMedium,
    ErplyFontConfig? displaySmall,
    ErplyFontConfig? headlineLarge,
    ErplyFontConfig? headlineMedium,
    ErplyFontConfig? headlineSmall,
    ErplyFontConfig? bodyLarge,
    ErplyFontConfig? bodyMedium,
    ErplyFontConfig? bodySmall,
    ErplyFontConfig? labelLarge,
    ErplyFontConfig? labelMedium,
    ErplyFontConfig? labelSmall,
    ErplyFontConfig? caption,
    ErplyFontConfig? overline,
  }) {
    return ErplyTypographyConfig(
      fontFamily: fontFamily,
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
    );
  }

  static final ErplyTypographyConfig defaultTypography =
      ErplyTypographyConfig.generate(
    fontFamily: defaultFontFamily,
  );
}
