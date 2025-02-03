import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A reusable SVG component that provides consistent SVG rendering
/// across the application with proper error handling and placeholder support.
class ErplySvg extends StatelessWidget {
  /// The asset path or URL of the SVG
  final String source;

  /// Width of the SVG
  final double? width;

  /// Height of the SVG
  final double? height;

  /// Color to apply to the SVG
  final Color? color;

  /// How to inscribe the SVG into the space allocated during layout
  final BoxFit fit;

  /// Placeholder widget to show while loading or on error
  final Widget? placeholder;

  /// Whether the source is a network URL
  final bool isUrl;

  /// Semantic label for the SVG
  final String? semanticsLabel;

  /// Whether to exclude this SVG from the semantics tree
  final bool excludeFromSemantics;

  /// Custom error widget to show when loading fails
  final Widget Function(BuildContext)? errorBuilder;

  /// Duration for the fade-in animation when the SVG loads
  final Duration? fadeInDuration;

  /// Whether to allow the SVG to be interactive
  final bool allowDrawingOutsideViewBox;

  /// Clip behavior for the SVG
  final Clip clipBehavior;

  /// Match text direction for the SVG
  final bool matchTextDirection;

  /// Creates an [ErplySvg] widget.
  ///
  /// The [source] parameter must not be null and should be either an asset path
  /// or a URL if [isUrl] is true.
  const ErplySvg({
    super.key,
    required this.source,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.isUrl = false,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.errorBuilder,
    this.fadeInDuration,
    this.allowDrawingOutsideViewBox = false,
    this.clipBehavior = Clip.hardEdge,
    this.matchTextDirection = false,
  });

  /// Creates an [ErplySvg] widget from an asset with a fade-in animation.
  ///
  /// The [assetName] parameter must not be null and should be a valid asset path.
  static Widget animated(
    String assetName, {
    Key? key,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.easeInOut,
    String? semanticsLabel,
  }) {
    return TweenAnimationBuilder<double>(
      key: key,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: ErplySvg.asset(
            assetName,
            width: width,
            height: height,
            color: color,
            fit: fit,
            semanticsLabel: semanticsLabel,
          ),
        );
      },
    );
  }

  /// Creates an [ErplySvg] widget from an asset.
  factory ErplySvg.asset(
    String assetName, {
    Key? key,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Widget? placeholder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Widget Function(BuildContext)? errorBuilder,
    Duration? fadeInDuration,
    bool allowDrawingOutsideViewBox = false,
    Clip clipBehavior = Clip.hardEdge,
    bool matchTextDirection = false,
  }) {
    return ErplySvg(
      key: key,
      source: assetName,
      width: width,
      height: height,
      color: color,
      fit: fit,
      placeholder: placeholder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      errorBuilder: errorBuilder,
      fadeInDuration: fadeInDuration,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      clipBehavior: clipBehavior,
      matchTextDirection: matchTextDirection,
    );
  }

  /// Creates an [ErplySvg] widget from a network URL.
  factory ErplySvg.network(
    String url, {
    Key? key,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Widget? placeholder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Widget Function(BuildContext)? errorBuilder,
    Duration? fadeInDuration,
    bool allowDrawingOutsideViewBox = false,
    Clip clipBehavior = Clip.hardEdge,
    bool matchTextDirection = false,
  }) {
    return ErplySvg(
      key: key,
      source: url,
      width: width,
      height: height,
      color: color,
      fit: fit,
      isUrl: true,
      placeholder: placeholder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      errorBuilder: errorBuilder,
      fadeInDuration: fadeInDuration,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      clipBehavior: clipBehavior,
      matchTextDirection: matchTextDirection,
    );
  }

  Widget buildSvg({
    required BuildContext context,
    required Widget Function(BuildContext, Widget?, bool) builder,
  }) {
    return builder(
      context,
      placeholder,
      false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget svgWidget = isUrl
        ? buildSvg(
            context: context,
            builder: (context, placeholder, _) => SvgPicture.network(
              source,
              width: width,
              height: height,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              fit: fit,
              placeholderBuilder:
                  placeholder != null ? (_) => placeholder : null,
              semanticsLabel: semanticsLabel,
              excludeFromSemantics: excludeFromSemantics,
              allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
              clipBehavior: clipBehavior,
              matchTextDirection: matchTextDirection,
            ),
          )
        : buildSvg(
            context: context,
            builder: (context, placeholder, _) => SvgPicture.asset(
              source,
              width: width,
              height: height,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              fit: fit,
              placeholderBuilder:
                  placeholder != null ? (_) => placeholder : null,
              semanticsLabel: semanticsLabel,
              excludeFromSemantics: excludeFromSemantics,
              allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
              clipBehavior: clipBehavior,
              matchTextDirection: matchTextDirection,
            ),
          );

    if (fadeInDuration != null) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: fadeInDuration!,
        builder: (context, value, child) {
          return Opacity(opacity: value, child: child);
        },
        child: svgWidget,
      );
    }

    return svgWidget;
  }
}
