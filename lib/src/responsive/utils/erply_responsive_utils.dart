import 'package:flutter/widgets.dart';

import '../erply_responsive_value.dart';
import '../erply_responsive_wrapper.dart';

/// Util functions for the ErplyResponsive Framework.
class ErplyResponsiveUtils {
  /// [ErplyResponsiveBreakpointBehavior] order.
  ///
  /// For breakpoints with the same value, ordering
  /// controls proper breakpoint behavior resolution.
  /// Preserve input order for breakpoints..
  /// Tags are always ranked last because they are
  /// inert.
  static Map<ErplyResponsiveBreakpointBehavior, int> breakpointCompartorList = {
    ErplyResponsiveBreakpointBehavior.AUTOSCALEDOWN: 0,
    ErplyResponsiveBreakpointBehavior.RESIZE: 0,
    ErplyResponsiveBreakpointBehavior.AUTOSCALE: 0,
    ErplyResponsiveBreakpointBehavior.TAG: 1,
  };

  /// Comparator function to order [ErplyResponsiveBreakpoint]s.
  ///
  /// Order breakpoints from smallest to largest based
  /// on breakpoint value.
  /// When breakpoint values are equal, map
  /// [ErplyResponsiveBreakpointBehavior] to their
  /// ordering value in [breakpointCompartorList]
  /// and compare.
  static int breakpointComparator(
      ErplyResponsiveBreakpoint a, ErplyResponsiveBreakpoint b) {
    // If breakpoints are equal, return in comparator order.
    if (a.breakpoint == b.breakpoint) {
      return breakpointCompartorList[a.behavior]!
          .compareTo(breakpointCompartorList[b.behavior]!);
    }

    // Breakpoints are not equal can be compared directly.
    return a.breakpoint.compareTo(b.breakpoint);
  }

  static bool isLargerThanMobile(BuildContext context) {
    return ErplyResponsiveValue(
          context,
          defaultValue: true,
          valueWhen: const [
            Condition.smallerThan(name: TABLET, value: false),
          ],
        ).value ??
        true;
  }

  static bool isLargerThanTablet(BuildContext context) {
    return ErplyResponsiveValue(
          context,
          defaultValue: true,
          valueWhen: const [
            Condition.smallerThan(name: TABLET, value: false),
          ],
        ).value ??
        true;
  }

  /// Print a visual view of [breakpointSegments]
  /// for debugging purposes.
  static String debugLogBreakpointSegments(
      List<ErplyResponsiveBreakpointSegment> responsiveBreakpointSegments) {
    var stringBuffer = StringBuffer();
    stringBuffer.write('|');
    for (int i = 0; i < responsiveBreakpointSegments.length; i++) {
      // Convenience variable.
      ErplyResponsiveBreakpointSegment segment =
          responsiveBreakpointSegments[i];
      stringBuffer.write(segment.breakpoint.round());
      List<dynamic> attributes = [];
      String? name = segment.responsiveBreakpoint.name;
      if (name != null) attributes.add(name);
      double scaleFactor = segment.responsiveBreakpoint.scaleFactor;
      if (scaleFactor != 1) attributes.add(scaleFactor);
      if (attributes.isNotEmpty) {
        stringBuffer.write('(');
        for (int i = 0; i < attributes.length; i++) {
          stringBuffer.write(attributes[i]);
          if (i != attributes.length - 1) stringBuffer.write('|');
        }
        stringBuffer.write(')');
      }
      stringBuffer.write(' ----- ');
      if (segment.segmentType ==
              ErplyResponsiveBreakpointBehavior.AUTOSCALEDOWN &&
          segment.breakpoint < segment.responsiveBreakpoint.breakpoint) {
        stringBuffer.write(
            '${segment.segmentType.name} from ${segment.responsiveBreakpoint.breakpoint.round()}');
      } else {
        stringBuffer.write(segment.responsiveBreakpoint.behavior.name);
      }
      if (i != responsiveBreakpointSegments.length - 1) {
        stringBuffer.write(' ----- ');
      }
    }
    stringBuffer.write(' ----- ∞ |');
    debugPrint(stringBuffer.toString());
    return stringBuffer.toString();
  }
}

enum ErplyResponsiveTargetPlatform {
  android,
  fuchsia,
  iOS,
  linux,
  macOS,
  windows,
  web,
}

extension TargetPlatformExtension on TargetPlatform {
  ErplyResponsiveTargetPlatform get responsiveTargetPlatform {
    switch (this) {
      case TargetPlatform.android:
        return ErplyResponsiveTargetPlatform.android;
      case TargetPlatform.fuchsia:
        return ErplyResponsiveTargetPlatform.fuchsia;
      case TargetPlatform.iOS:
        return ErplyResponsiveTargetPlatform.iOS;
      case TargetPlatform.linux:
        return ErplyResponsiveTargetPlatform.linux;
      case TargetPlatform.macOS:
        return ErplyResponsiveTargetPlatform.macOS;
      case TargetPlatform.windows:
        return ErplyResponsiveTargetPlatform.windows;
    }
  }
}
