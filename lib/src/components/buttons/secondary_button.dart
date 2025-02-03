import 'package:flutter/material.dart';
import '../svg/erply_svg.dart';

/// Secondary button component for consistent styling
class ErplySecondaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final String? iconPath;
  final double? width;
  final double? height;

  const ErplySecondaryButton({
    super.key,
    this.text,
    this.onPressed,
    this.isLoading = false,
    this.iconPath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(width ?? 88.0, height ?? 36.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          else if (iconPath != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ErplySvg.asset(
                iconPath!,
                width: 20,
                height: 20,
                color: Theme.of(context).colorScheme.primary,
                fadeInDuration: const Duration(milliseconds: 200),
              ),
            ),
          if (text != null) Text(text!),
        ],
      ),
    );
  }
}
