import 'package:flutter/material.dart';

import '../../core/design/models/erply_tokens.dart';

/// A responsive dialog wrapper that adapts to different screen sizes
/// Provides consistent styling and responsive constraints for dialogs
class ErplyDialogWrapper extends StatelessWidget {
  /// Creates a dialog wrapper with responsive design
  const ErplyDialogWrapper({
    super.key,
    required this.child,
    this.maxWidth = 800,
    this.maxHeight = 600,
    this.backgroundColor,
    this.elevation = 4.0,
    required this.isLargerThanMobile,
  });

  /// The child widget to be displayed inside the dialog
  final Widget child;

  /// Maximum width for larger screens
  /// Defaults to 800
  final double maxWidth;

  /// Maximum height for larger screens
  /// Defaults to 600
  final double maxHeight;

  /// Optional background color
  /// If not provided, uses theme's background color
  final Color? backgroundColor;

  /// Elevation for the dialog
  /// Defaults to 4.0
  final double elevation;

  final bool isLargerThanMobile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Material(
        color: Colors.transparent,
        elevation: elevation,
        child: Container(
          constraints: isLargerThanMobile
              ? BoxConstraints(
                  maxWidth: maxWidth,
                  maxHeight: maxHeight,
                )
              : null,
          decoration: BoxDecoration(
            color: backgroundColor ?? theme.dialogBackgroundColor,
            borderRadius:
                isLargerThanMobile ? ErplyTokens.roundedMd : BorderRadius.zero,
            boxShadow: isLargerThanMobile
                ? [
                    BoxShadow(
                      color: theme.shadowColor.withValues(alpha: 0.2),
                      blurRadius: 12,
                      spreadRadius: 2,
                    )
                  ]
                : null,
          ),
          clipBehavior: Clip.hardEdge,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 300,
              minHeight: 200,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
