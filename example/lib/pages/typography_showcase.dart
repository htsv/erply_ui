import 'package:flutter/material.dart';
import 'package:erply_ui/erply_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/erply_scaffold.dart';

class TypographyShowcase extends ConsumerWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(erplyThemeProvider);
    final typographyConfig = themeState.currentTypographyConfig;

    // Use responsive typography
    final typography = ErplyThemeUtils.updateTypographyForScreenSize(
      context,
      typographyConfig,
    );

    return ErplyScaffold(
      title: 'Typography Showcase',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Display Large', style: typography.displayLarge.toTextStyle()),
            Text('Display Medium',
                style: typography.displayMedium.toTextStyle()),
            Text('Display Small', style: typography.displaySmall.toTextStyle()),
            Text('Headline Large',
                style: typography.headlineLarge.toTextStyle()),
            Text('Headline Medium',
                style: typography.headlineMedium.toTextStyle()),
            Text('Headline Small',
                style: typography.headlineSmall.toTextStyle()),
            Text('Body Large', style: typography.bodyLarge.toTextStyle()),
            Text('Body Medium', style: typography.bodyMedium.toTextStyle()),
            Text('Body Small', style: typography.bodySmall.toTextStyle()),
          ],
        ),
      ),
    );
  }
}
