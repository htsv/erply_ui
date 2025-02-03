import 'package:flutter/material.dart';

/// Configuration for standardized animations across the Erply UI
class ErplyAnimationConfig {
  /// Standard duration for quick animations
  static const Duration quickAnimation = Duration(milliseconds: 200);

  /// Standard duration for medium-length animations
  static const Duration mediumAnimation = Duration(milliseconds: 350);

  /// Standard duration for slow animations
  static const Duration slowAnimation = Duration(milliseconds: 500);

  /// Predefined animation curves
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve linear = Curves.linear;

  /// Create a standard fade animation
  static AnimatedOpacity fadeAnimation({
    required Widget child,
    required bool visible,
    Duration duration = quickAnimation,
    Curve curve = fastOutSlowIn,
  }) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: duration,
      curve: curve,
      child: child,
    );
  }

  /// Create a slide transition animation
  static SlideTransition slideTransition({
    required Widget child,
    Offset beginOffset = const Offset(1.0, 0.0),
    Duration duration = mediumAnimation,
    Curve curve = fastOutSlowIn,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: beginOffset,
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: const AlwaysStoppedAnimation(1.0),
        curve: curve,
      )),
      child: child,
    );
  }

  /// Create a scale transition animation
  static ScaleTransition scaleTransition({
    required Widget child,
    double beginScale = 0.8,
    Duration duration = quickAnimation,
    Curve curve = fastOutSlowIn,
  }) {
    return ScaleTransition(
      scale: Tween<double>(begin: beginScale, end: 1.0).animate(
        CurvedAnimation(
          parent: const AlwaysStoppedAnimation(1.0),
          curve: curve,
        ),
      ),
      child: child,
    );
  }
}
