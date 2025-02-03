import 'package:flutter/material.dart';

/// Defines a navigation item for the responsive layout
class ErplyNavigationItem {
  final IconData icon;
  final String label;
  final Widget? selectedIcon;
  final VoidCallback onTap;

  const ErplyNavigationItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
    required this.onTap,
  });
}

/// A responsive layout with adaptive navigation
class ErplyResponsiveLayout extends StatefulWidget {
  /// The main content of the page
  final Widget content;

  /// List of navigation items
  final List<ErplyNavigationItem> navigationItems;

  /// Optional app bar title
  final String? title;

  /// Optional actions for the app bar
  final List<Widget>? actions;

  /// Currently selected navigation index
  final int selectedIndex;

  /// Optional background color for the scaffold
  final Color? backgroundColor;

  const ErplyResponsiveLayout({
    super.key,
    required this.content,
    required this.navigationItems,
    this.title,
    this.actions,
    this.selectedIndex = 0,
    this.backgroundColor,
  });

  @override
  _ErplyResponsiveLayoutState createState() => _ErplyResponsiveLayoutState();
}

class _ErplyResponsiveLayoutState extends State<ErplyResponsiveLayout> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if we're on a small screen
        final isSmallScreen = constraints.maxWidth < 600;

        return Scaffold(
          backgroundColor: widget.backgroundColor,
          appBar: AppBar(
            title: widget.title != null ? Text(widget.title!) : null,
            actions: widget.actions,
          ),
          // Use drawer for small screens
          drawer: isSmallScreen ? _buildDrawer() : null,
          // Use navigation rail for larger screens
          body: Row(
            children: [
              // Navigation Rail for larger screens
              if (!isSmallScreen)
                NavigationRail(
                  extended: constraints.maxWidth > 800,
                  backgroundColor: Theme.of(context).canvasColor,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                      widget.navigationItems[index].onTap();
                    });
                  },
                  labelType: constraints.maxWidth > 800
                      ? NavigationRailLabelType.none
                      : NavigationRailLabelType.all,
                  destinations: widget.navigationItems.map((item) {
                    return NavigationRailDestination(
                      icon: Icon(item.icon),
                      selectedIcon: item.selectedIcon ?? Icon(item.icon),
                      label: Text(item.label),
                    );
                  }).toList(),
                ),

              // Main content area
              Expanded(child: widget.content),
            ],
          ),
        );
      },
    );
  }

  /// Build a drawer for small screens
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              widget.title ?? 'Navigation',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          ...widget.navigationItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.label),
              selected: _selectedIndex == index,
              onTap: () {
                Navigator.of(context).pop(); // Close drawer
                setState(() {
                  _selectedIndex = index;
                  item.onTap();
                });
              },
            );
          }),
        ],
      ),
    );
  }
}
