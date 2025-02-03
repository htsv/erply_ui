import 'package:flutter/material.dart';

/// Centralized design tokens for spacing, border radius, and consistent design values
/// Provides uniform design primitives across the entire Erply UI package
class ErplyTokens {
  // Spacing values
  static const double xs = 4.0; // Extra small
  static const double sm = 8.0; // Small
  static const double md = 12.0; // Medium
  static const double lg = 16.0; // Large
  static const double xl = 24.0; // Extra large
  static const double xxl = 32.0; // Extra extra large

  // Border Radius values
  static const double borderRadiusXs = 4.0;
  static const double borderRadiusSm = 8.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 16.0;
  static const double borderRadiusXl = 24.0;
  static const double borderRadiusCircular = 9999.0; // Fully rounded

  // Predefined border radius
  static BorderRadius get roundedXs => BorderRadius.circular(borderRadiusXs);
  static BorderRadius get roundedSm => BorderRadius.circular(borderRadiusSm);
  static BorderRadius get roundedMd => BorderRadius.circular(borderRadiusMd);
  static BorderRadius get roundedLg => BorderRadius.circular(borderRadiusLg);
  static BorderRadius get roundedXl => BorderRadius.circular(borderRadiusXl);
  static BorderRadius get roundedCircular =>
      BorderRadius.circular(borderRadiusCircular);

  // Padding helpers
  static EdgeInsets get paddingXs => const EdgeInsets.all(xs);
  static EdgeInsets get paddingSm => const EdgeInsets.all(sm);
  static EdgeInsets get paddingMd => const EdgeInsets.all(md);
  static EdgeInsets get paddingLg => const EdgeInsets.all(lg);
  static EdgeInsets get paddingXl => const EdgeInsets.all(xl);

  // Symmetric padding helpers
  static EdgeInsets get horizontalPaddingSm =>
      const EdgeInsets.symmetric(horizontal: sm);
  static EdgeInsets get horizontalPaddingMd =>
      const EdgeInsets.symmetric(horizontal: md);
  static EdgeInsets get verticalPaddingSm =>
      const EdgeInsets.symmetric(vertical: sm);
  static EdgeInsets get verticalPaddingMd =>
      const EdgeInsets.symmetric(vertical: md);

  // SizedBox helpers
  static SizedBox get sizedBoxXs => const SizedBox(height: xs, width: xs);
  static SizedBox get sizedBoxSm => const SizedBox(height: sm, width: sm);
  static SizedBox get sizedBoxMd => const SizedBox(height: md, width: md);
  static SizedBox get sizedBoxLg => const SizedBox(height: lg, width: lg);
  static SizedBox get sizedBoxXl => const SizedBox(height: xl, width: xl);

  // Vertical SizedBox helpers
  static SizedBox verticalSizedBoxXs = const SizedBox(height: xs);
  static SizedBox verticalSizedBoxSm = const SizedBox(height: sm);
  static SizedBox verticalSizedBoxMd = const SizedBox(height: md);
  static SizedBox verticalSizedBoxLg = const SizedBox(height: lg);
  static SizedBox verticalSizedBoxXl = const SizedBox(height: xl);

  // Horizontal SizedBox helpers
  static SizedBox horizontalSizedBoxXs = const SizedBox(width: xs);
  static SizedBox horizontalSizedBoxSm = const SizedBox(width: sm);
  static SizedBox horizontalSizedBoxMd = const SizedBox(width: md);
  static SizedBox horizontalSizedBoxLg = const SizedBox(width: lg);
  static SizedBox horizontalSizedBoxXl = const SizedBox(width: xl);
}

/// Extension on BuildContext to easily access design tokens
extension ErplyTokensContext on BuildContext {
  // Spacing getters
  double get spacingXs => ErplyTokens.xs;
  double get spacingSm => ErplyTokens.sm;
  double get spacingMd => ErplyTokens.md;
  double get spacingLg => ErplyTokens.lg;
  double get spacingXl => ErplyTokens.xl;

  // Border radius getters
  BorderRadius get roundedXs => ErplyTokens.roundedXs;
  BorderRadius get roundedSm => ErplyTokens.roundedSm;
  BorderRadius get roundedMd => ErplyTokens.roundedMd;
  BorderRadius get roundedLg => ErplyTokens.roundedLg;

  // SizedBox getters
  SizedBox get sizedBoxXs => ErplyTokens.sizedBoxXs;
  SizedBox get sizedBoxSm => ErplyTokens.sizedBoxSm;
  SizedBox get sizedBoxMd => ErplyTokens.sizedBoxMd;
  SizedBox get sizedBoxLg => ErplyTokens.sizedBoxLg;
  SizedBox get sizedBoxXl => ErplyTokens.sizedBoxXl;

  // Vertical SizedBox getters
  SizedBox get verticalSizedBoxXs => ErplyTokens.verticalSizedBoxXs;
  SizedBox get verticalSizedBoxSm => ErplyTokens.verticalSizedBoxSm;
  SizedBox get verticalSizedBoxMd => ErplyTokens.verticalSizedBoxMd;
  SizedBox get verticalSizedBoxLg => ErplyTokens.verticalSizedBoxLg;
  SizedBox get verticalSizedBoxXl => ErplyTokens.verticalSizedBoxXl;

  // Horizontal SizedBox getters
  SizedBox get horizontalSizedBoxXs => ErplyTokens.horizontalSizedBoxXs;
  SizedBox get horizontalSizedBoxSm => ErplyTokens.horizontalSizedBoxSm;
  SizedBox get horizontalSizedBoxMd => ErplyTokens.horizontalSizedBoxMd;
  SizedBox get horizontalSizedBoxLg => ErplyTokens.horizontalSizedBoxLg;
  SizedBox get horizontalSizedBoxXl => ErplyTokens.horizontalSizedBoxXl;
}
