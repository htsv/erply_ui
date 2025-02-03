import 'package:flutter/material.dart';
import 'package:erply_ui/erply_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/erply_scaffold.dart';

class ColorShowcase extends ConsumerWidget {
  const ColorShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(erplyThemeProvider);
    final theme = themeState.theme;
    final colorConfig = themeState.variant == ErplyThemeVariant.light
        ? theme.lightColorConfig
        : theme.darkColorConfig;

    return ErplyScaffold(
      title: 'Color Showcase',
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          _ColorTile('Primary', colorConfig.primary),
          _ColorTile('Secondary', colorConfig.secondary),
          _ColorTile('Tertiary', colorConfig.tertiary),
          _ColorTile('Error', colorConfig.error),
          _ColorTile('Background', colorConfig.background),
          _ColorTile('Surface', colorConfig.surface),
        ],
      ),
    );
  }
}

class _ColorTile extends StatelessWidget {
  final String name;
  final Color color;

  const _ColorTile(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
