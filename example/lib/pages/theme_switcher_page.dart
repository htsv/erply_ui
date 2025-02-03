import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:erply_ui/erply_ui.dart';

import '../widgets/erply_scaffold.dart';

class ThemeSwitcherPage extends ConsumerWidget {
  const ThemeSwitcherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(erplyThemeProvider);
    final themeNotifier = ref.read(erplyThemeProvider.notifier);

    return ErplyScaffold(
      title: 'Theme Switcher',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Variant Section
          _buildSectionTitle(context, 'Theme Variant'),
          _buildVariantToggle(context, themeState, themeNotifier),

          const SizedBox(height: 24),

          // Color Themes Section
          _buildSectionTitle(context, 'Color Themes'),
          _buildThemeSelector(context, themeState, themeNotifier),

          const SizedBox(height: 24),

          // Typography Preview
          _buildSectionTitle(context, 'Typography Preview'),
          _buildTypographyPreview(context, themeState),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildVariantToggle(
    BuildContext context,
    ErplyThemeState themeState,
    ErplyThemeNotifier themeNotifier,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildVariantChip(
          context: context,
          label: 'Light Theme',
          isSelected: themeState.variant == ErplyThemeVariant.light,
          onSelected: () => themeNotifier.setTheme(
            themeState.theme,
            variant: ErplyThemeVariant.light,
          ),
        ),
        _buildVariantChip(
          context: context,
          label: 'Dark Theme',
          isSelected: themeState.variant == ErplyThemeVariant.dark,
          onSelected: () => themeNotifier.setTheme(
            themeState.theme,
            variant: ErplyThemeVariant.dark,
          ),
        ),
      ],
    );
  }

  Widget _buildVariantChip({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onSelected,
  }) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  Widget _buildThemeSelector(
    BuildContext context,
    ErplyThemeState themeState,
    ErplyThemeNotifier themeNotifier,
  ) {
    return Column(
      children: [
        ...ErplyThemeRegistry.getThemes().map(
          (theme) => _buildThemeCard(
            context,
            themeName: theme.name,
            onSelect: () => themeNotifier.setTheme(
              theme,
              variant: themeState.variant,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThemeCard(
    BuildContext context, {
    required String themeName,
    required VoidCallback onSelect,
  }) {
    return Card(
      child: ListTile(
        title: Text(themeName),
        trailing: const Icon(Icons.chevron_right),
        onTap: onSelect,
      ),
    );
  }

  Widget _buildTypographyPreview(
    BuildContext context,
    ErplyThemeState themeState,
  ) {
    final typography = themeState.theme.typographyConfig;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display Large', style: typography.displayLarge.toTextStyle()),
        Text('Display Medium', style: typography.displayMedium.toTextStyle()),
        Text('Headline Large', style: typography.headlineLarge.toTextStyle()),
        Text('Body Large', style: typography.bodyLarge.toTextStyle()),
      ],
    );
  }
}
