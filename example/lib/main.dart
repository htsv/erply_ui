import 'package:erply_ui_example/themes/example_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:erply_ui/erply_ui.dart';

import 'pages/typography_showcase.dart';
import 'pages/color_showcase.dart';
import 'pages/components_showcase.dart';
import 'pages/responsive_showcase.dart';
import 'pages/theme_switcher_page.dart';
import 'widgets/erply_scaffold.dart';

void main() {
  ErplyThemeRegistry.registerThemes([appThemeData, exampleErplyTheme]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(erplyThemeProvider);

    return MaterialApp(
      theme: themeState.theme.createLightTheme(),
      darkTheme: themeState.theme.createDarkTheme(),
      themeMode: themeState.variant.toThemeMode(),
      home: const ExampleHomePage(),
      routes: {
        '/home': (context) => const ExampleHomePage(),
        '/typography': (context) => const TypographyShowcase(),
        '/colors': (context) => const ColorShowcase(),
        '/components': (context) => const ComponentsShowcase(),
        '/responsive': (context) => const ResponsiveShowcase(),
        '/theme-switcher': (context) => const ThemeSwitcherPage(),
      },
      builder: (context, widget) {
        return ErplyResponsiveWrapper.builder(
          ErplyBouncingScrollWrapper.builder(
            context,
            widget!,
          ),
          minWidth: 400,
          defaultScale: true,
          breakpoints: const [
            ErplyResponsiveBreakpoint.resize(480, name: MOBILE),
            ErplyResponsiveBreakpoint.autoScale(800, name: TABLET),
            ErplyResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ErplyResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          background: Container(
            color: themeState.currentColorConfig.background,
          ),
        );
      },
    );
  }
}

class ExampleHomePage extends ConsumerWidget {
  const ExampleHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ErplyScaffold(
      title: 'Erply UI Showcase',
      showThemeToggle: true,
      body: ListView(
        children: [
          _buildPageTile(
            context,
            'Typography',
            const TypographyShowcase(),
            route: '/typography',
          ),
          _buildPageTile(
            context,
            'Colors',
            const ColorShowcase(),
            route: '/colors',
          ),
          _buildPageTile(
            context,
            'Components',
            const ComponentsShowcase(),
            route: '/components',
          ),
          _buildPageTile(
            context,
            'Responsive',
            const ResponsiveShowcase(),
            route: '/responsive',
          ),
          _buildPageTile(
            context,
            'Theme Switcher',
            const ThemeSwitcherPage(),
            route: '/theme-switcher',
          ),
        ],
      ),
    );
  }

  Widget _buildPageTile(
    BuildContext context,
    String title,
    Widget page, {
    required String route,
  }) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.of(context).pushNamed(route),
    );
  }
}
