// TODO: How to implement theme utils so that theme updates to reflect the typography changes based on the screen size?

import 'package:erply_ui/erply_ui.dart';
import 'package:flutter/material.dart';

import '../../core/typography/models/erply_typography_config.dart';

/// Utility class for theme-related operations
class ErplyThemeUtils {
  /// Calculate the typography scale factor based on screen width
  static double calculateTypographyScaleFactor(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 360) return 0.8; // Extra small devices
    if (screenWidth < 576) return 0.9; // Small devices
    if (screenWidth < 768) return 1.0; // Medium devices
    if (screenWidth < 992) return 1.1; // Large devices
    if (screenWidth < 1200) return 1.2; // Extra large devices
    return 1.3; // Extra extra large devices
  }

  /// Update typography configuration based on screen size
  static ErplyTypographyConfig updateTypographyForScreenSize(
    BuildContext context,
    ErplyTypographyConfig originalConfig,
  ) {
    final scaleFactor = calculateTypographyScaleFactor(context);

    return ErplyTypographyConfig.generate(
      scaleFactor: scaleFactor,
      displayColor: originalConfig.displayLarge.color,
      bodyColor: originalConfig.bodyLarge.color,
      displayFontFamily: originalConfig.displayLarge.fontFamily,
      bodyFontFamily: originalConfig.bodyLarge.fontFamily,
    );
  }

  /// Create a responsive text theme from a typography configuration
  static TextTheme createResponsiveTextTheme(
    BuildContext context,
    ErplyTypographyConfig typographyConfig,
  ) {
    final responsiveConfig =
        updateTypographyForScreenSize(context, typographyConfig);
    return responsiveConfig.toTextTheme();
  }
}

// /// Extension to easily access responsive typography utilities
// extension ErplyResponsiveThemeContext on BuildContext {
//   /// Get a typography configuration scaled for the current screen size
//   ErplyTypographyConfig get responsiveTypography => 
//     ErplyThemeUtils.updateTypographyForScreenSize(
//       this, 
//       Theme.of(this).extension<ErplyThemeData>()?.typographyConfig ?? 
//       ErplyTypographyConfig.generate()
//     );

//   /// Get a responsive text theme for the current screen size
//   TextTheme get responsiveTextTheme => 
//     ErplyThemeUtils.createResponsiveTextTheme(
//       this, 
//       Theme.of(this).extension<ErplyThemeData>()?.typographyConfig ?? 
//       ErplyTypographyConfig.generate()
//     );
// }
