import 'package:flutter/widgets.dart';

class ErplyBouncingScrollBehavior extends ScrollBehavior {
  // Disable overscroll glow.
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  // Set physics to bouncing.
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class ErplyBouncingScrollWrapper extends StatelessWidget {
  final Widget child;

  const ErplyBouncingScrollWrapper({super.key, required this.child});

  static Widget builder(BuildContext context, Widget child) {
    return ErplyBouncingScrollWrapper(child: child);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ErplyBouncingScrollBehavior(),
      child: child,
    );
  }
}

class ErplyClampingScrollBehavior extends ScrollBehavior {
  // Disable overscroll glow.
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  // Set physics to clamping.
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}

class ErplyClampingScrollWrapper extends StatelessWidget {
  final Widget child;

  const ErplyClampingScrollWrapper({super.key, required this.child});

  static Widget builder(BuildContext context, Widget child) {
    return ErplyClampingScrollWrapper(child: child);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ErplyClampingScrollBehavior(),
      child: child,
    );
  }
}
