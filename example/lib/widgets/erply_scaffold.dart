import 'package:erply_ui/erply_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../pages/color_showcase.dart';
import '../pages/components_showcase.dart';
import '../pages/responsive_showcase.dart';
import '../pages/typography_showcase.dart';

class ErplyScaffold extends ConsumerWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final bool showThemeToggle;

  const ErplyScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.actions,
    this.showThemeToggle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(erplyThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (showThemeToggle)
            IconButton(
              icon: Icon(themeState.variant == ErplyThemeVariant.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                ref.read(erplyThemeProvider.notifier).toggleThemeVariant();
              },
            ),
          if (actions != null) ...actions!,
        ],
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
      ),
      body: body,
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(context),
      onTap: (index) => _navigateToPage(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.palette),
          label: 'Typography',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.color_lens),
          label: 'Colors',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets),
          label: 'Components',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.display_settings),
          label: 'Responsive',
        ),
      ],
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    switch (route) {
      case '/home':
        return 0;
      case '/typography':
        return 1;
      case '/colors':
        return 2;
      case '/components':
        return 3;
      case '/responsive':
        return 4;
      default:
        return 0;
    }
  }

  void _navigateToPage(BuildContext context, int index) {
    if (_getCurrentIndex(context) == index) return;

    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const ExampleHomePage()),
          (route) => false,
        );
        break;
      case 1:
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/typography',
          (route) => false,
          arguments: const TypographyShowcase(),
        );
        break;
      case 2:
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/colors',
          (route) => false,
          arguments: const ColorShowcase(),
        );
        break;
      case 3:
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/components',
          (route) => false,
          arguments: const ComponentsShowcase(),
        );
        break;
      case 4:
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/responsive',
          (route) => false,
          arguments: const ResponsiveShowcase(),
        );
        break;
    }
  }
}
