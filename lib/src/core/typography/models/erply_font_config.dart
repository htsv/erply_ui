import 'package:flutter/material.dart';

/// Represents a configuration for a font with detailed customization options
class ErplyFontConfig {
  final String? fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final double? letterSpacing;
  final double? height;

  const ErplyFontConfig({
    this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.letterSpacing,
    this.height,
  });

  /// Create a TextStyle from this configuration
  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  /// Create a copy with some properties overridden
  ErplyFontConfig copyWith({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return ErplyFontConfig(
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      height: height ?? this.height,
    );
  }
}
