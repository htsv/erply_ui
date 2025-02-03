import 'package:flutter/material.dart';

/// Utility class for handling complex animations
class ErplyAnimationUtils {
  /// Create a custom staggered animation
  static Animation<double> createStaggeredAnimation({
    required AnimationController controller,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.easeInOut,
    required double interval,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          interval,
          1.0,
          curve: curve,
        ),
      ),
    );
  }

  /// Perform a page transition with custom animation
  static Route createPageRouteTransition({
    required Widget page,
    RouteTransitionsBuilder? transitionsBuilder,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: transitionsBuilder ?? defaultTransition,
    );
  }

  /// Default page transition animation
  static Widget defaultTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  /// Animate list items with a staggered entrance
  static Widget staggeredListAnimation({
    required BuildContext context,
    required Animation<double> animation,
    required Widget child,
    Offset beginOffset = const Offset(0.5, 0.0),
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: beginOffset,
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ),
      ),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
