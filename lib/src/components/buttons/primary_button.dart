import 'package:flutter/material.dart';
import '../svg/erply_svg.dart';

/// Primary button component for consistent styling
class ErplyPrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final String? iconPath;
  final double? width;
  final double? height;

  const ErplyPrimaryButton({
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
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
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
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          if (text != null) Text(text!),
        ],
      ),
    );
  }
}
