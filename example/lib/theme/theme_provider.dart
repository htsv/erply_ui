// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:erply_ui/erply_ui.dart';

// // Theme state provider
// final themeStateProvider =
//     StateNotifierProvider<ErplyThemeNotifier, ErplyThemeState>((ref) {
//   return ErplyThemeNotifier(defaultErplyThemeState);
// });

// class ErplyThemeNotifier extends StateNotifier<ErplyThemeState> {
//   ErplyThemeNotifier(super.initialState);

//   // Update entire theme data
//   void updateThemeData(ErplyThemeState newThemeState) {
//     state = newThemeState;
//   }

//   // Update typography based on screen size
//   void updateTypographyForScreenSize(double screenWidth) {
//     final scaleFactor = _calculateTypographyScaleFactor(screenWidth);

//     final updatedTypography =
//         ErplyTypographyConfig.generateWithTwoColorsAndFontFamily(
//       scaleFactor: scaleFactor,
//       displayColor: state.theme.typographyConfig.displayLarge.color,
//       bodyColor: state.theme.typographyConfig.bodyLarge.color,
//       displayFontFamily: state.theme.typographyConfig.displayLarge.fontFamily,
//       bodyFontFamily: state.theme.typographyConfig.bodyLarge.fontFamily,
//     );

//     state = state.copyWith(
//       theme: state.theme.copyWith(typographyConfig: updatedTypography),
//     );
//   }

//   // Responsive typography scale factor calculation
//   double _calculateTypographyScaleFactor(double screenWidth) {
//     if (screenWidth < 360) return 0.8; // Extra small devices
//     if (screenWidth < 576) return 0.9; // Small devices
//     if (screenWidth < 768) return 1.0; // Medium devices
//     if (screenWidth < 992) return 1.1; // Large devices
//     if (screenWidth < 1200) return 1.2; // Extra large devices
//     return 1.3; // Extra extra large devices
//   }

//   // Toggle between light and dark theme
//   void toggleThemeVariant() {
//     final newVariant = state.variant == ErplyThemeVariant.light
//         ? ErplyThemeVariant.dark
//         : ErplyThemeVariant.light;

//     state = state.copyWith(variant: newVariant);
//   }
// }
