# Erply UI 

## Overview
Erply UI is a comprehensive, responsive, and highly customizable Flutter UI kit designed to streamline the development of modern, elegant applications with a focus on design consistency and developer experience.

## Features

### Design System
- Fully customizable theme management
- Light and dark mode support
- Responsive typography scaling
- Comprehensive color configuration

### Components
- Form inputs
- Bottom sheet pickers
- Responsive dialogs
- Navigation components
- Typography utilities

### Responsive Design
- Adaptive layouts
- Breakpoint-based scaling
- Cross-device compatibility

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  erply_ui: ^latest_version
```

## Getting Started

### Theme Configuration
```dart
// Create a custom theme
final customTheme = ErplyThemeData(
  name: 'Custom Theme',
  lightColorConfig: ErplyColorConfig.defaultLight.copyWith(
    primary: Colors.green,
    secondary: Colors.red,
  ),
  typographyConfig: ErplyTypographyConfig.generate(
    fontFamily: 'Roboto',
  ),
);

// Register the theme
ErplyThemeRegistry.registerTheme(customTheme);
```

### Responsive Typography
```dart
// Automatically scale typography based on screen size
final typography = ErplyThemeUtils.updateTypographyForScreenSize(
  context,
  typographyConfig,
);

Text('Responsive Text', style: typography.bodyLarge.toTextStyle());
```

### Theme Switching
```dart
// Toggle between light and dark themes
ref.read(erplyThemeProvider.notifier).toggleThemeVariant();
```

## Components

### Bottom Sheet List Picker
```dart
ErplyBottomSheetListPickerFormField(
  items: [
    ErplyPickerItem(label: 'Option 1', value: '1'),
    ErplyPickerItem(label: 'Option 2', value: '2'),
  ],
  onChanged: (value) {
    // Handle selection
  },
)
```

### Responsive Dialog
```dart
ErplyDialogWrapper(
  isLargerThanMobile: true,
  child: YourDialogContent(),
)
```

## Customization

### Color Configuration
```dart
// Customize color configurations
final customColorConfig = ErplyColorConfig.defaultLight.copyWith(
  primary: Colors.blue,
  secondary: Colors.orange,
);
```

### Typography Configuration
```dart
// Generate custom typography
final customTypography = ErplyTypographyConfig.generate(
  fontFamily: 'CustomFont',
  scaleFactor: 1.1,
);
```

## Performance Optimization
- Lightweight and tree-shakable
- Minimal runtime overhead
- Efficient theme management with Riverpod

## Contributing
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License
MIT License

## Support
For issues, feature requests, or support, please file an issue on our GitHub repository.

---

**Made with ❤️ by Erply Engineering**

## Detailed Module Examples

### 🎨 Theme Management
#### Basic Theme Configuration
```dart
// Create a custom theme with specific color and typography configurations
final customTheme = ErplyThemeData(
  name: 'Corporate Theme',
  lightColorConfig: ErplyColorConfig.defaultLight.copyWith(
    primary: Colors.blue[700],
    secondary: Colors.teal[500],
    background: Colors.white,
    surface: Colors.grey[100],
  ),
  darkColorConfig: ErplyColorConfig.defaultDark.copyWith(
    primary: Colors.blue[300],
    secondary: Colors.teal[200],
    background: Colors.grey[900],
    surface: Colors.grey[850],
  ),
  typographyConfig: ErplyTypographyConfig.generate(
    fontFamily: 'Roboto',
    scaleFactor: 1.1,
  ),
);

// Register the theme
ErplyThemeRegistry.registerThemes([customTheme]);
```

#### Theme Switching
```dart
class ThemeDemoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(erplyThemeProvider.notifier);
    
    return Scaffold(
      body: Column(
        children: [
          // Toggle theme variant
          ElevatedButton(
            onPressed: () => themeNotifier.toggleThemeVariant(),
            child: Text('Toggle Light/Dark Mode'),
          ),
          
          // Switch to a specific theme
          ElevatedButton(
            onPressed: () => themeNotifier.setTheme(
              customTheme, 
              variant: ErplyThemeVariant.light
            ),
            child: Text('Switch to Corporate Light Theme'),
          ),
        ],
      ),
    );
  }
}
```

### 📱 Responsive Components
#### Bottom Sheet List Picker
```dart
class CountrySelectionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ErplyBottomSheetListPickerFormField(
      label: 'Select Country',
      hint: 'Choose your country',
      items: [
        ErplyPickerItem(label: 'United States', value: 'US'),
        ErplyPickerItem(label: 'Canada', value: 'CA'),
        ErplyPickerItem(label: 'United Kingdom', value: 'UK'),
        ErplyPickerItem(label: 'Australia', value: 'AU'),
      ],
      validator: (value) {
        if (value == null) return 'Please select a country';
        return null;
      },
      onChanged: (selectedCountry) {
        print('Selected country: $selectedCountry');
      },
    );
  }
}
```

#### Responsive Form Inputs
```dart
class RegistrationForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Text Input with validation
          ErplyTextFormField(
            label: 'Full Name',
            hintText: 'Enter your full name',
            prefixIcon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),

          // Email Input
          ErplyEmailFormField(
            label: 'Email Address',
            hintText: 'Enter your email',
            validator: (email) {
              if (email == null || !email.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),

          // Password Input
          ErplyPasswordFormField(
            label: 'Password',
            hintText: 'Create a strong password',
            validator: (password) {
              if (password == null || password.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),

          // Submit Button
          ErplyPrimaryButton(
            text: 'Register',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Process registration
              }
            },
          ),
        ],
      ),
    );
  }
}
```

### 🌈 Color Customization
```dart
class ColorCustomizationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a custom color configuration
    final customColorConfig = ErplyColorConfig.defaultLight.copyWith(
      primary: Color(0xFF3498db),      // Vibrant blue
      secondary: Color(0xFF2ecc71),    // Emerald green
      success: Color(0xFF27ae60),      // Nephritis green
      error: Color(0xFFe74c3c),        // Alizarin red
      warning: Color(0xFFf39c12),      // Orange
    );

    return Container(
      color: customColorConfig.background,
      child: Column(
        children: [
          Text(
            'Customized Color Theme',
            style: TextStyle(color: customColorConfig.primary),
          ),
          Text(
            'Success Message',
            style: TextStyle(color: customColorConfig.success),
          ),
        ],
      ),
    );
  }
}
```

### 🔤 Typography Management
```dart
class TypographyShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Generate responsive typography
    final typography = ErplyTypographyConfig.generate(
      fontFamily: 'Inter',
      scaleFactor: MediaQuery.of(context).size.width < 600 ? 0.9 : 1.1,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display Large', style: typography.displayLarge.toTextStyle()),
        Text('Headline Medium', style: typography.headlineMedium.toTextStyle()),
        Text('Body Large', style: typography.bodyLarge.toTextStyle()),
        Text('Caption', style: typography.caption.toTextStyle()),
      ],
    );
  }
}
```

### 📊 Responsive Dialog
```dart
class ResponsiveDialogExample extends StatelessWidget {
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ErplyDialogWrapper(
        title: 'Confirm Action',
        content: Text('Are you sure you want to proceed?'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: Text('Confirm'),
            onPressed: () {
              // Perform action
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showCustomDialog(context),
      child: Text('Show Responsive Dialog'),
    );
  }
}
```

### 🧩 Component Integration
```dart
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          // Bottom Sheet List Picker
          ErplyBottomSheetListPickerFormField(
            label: 'Select Project',
            items: [
              ErplyPickerItem(label: 'Web Development', value: 'web'),
              ErplyPickerItem(label: 'Mobile App', value: 'mobile'),
            ],
            onChanged: (project) {
              // Handle project selection
            },
          ),

          // Responsive Form Input
          ErplyTextFormField(
            label: 'Project Description',
            maxLines: 3,
          ),

          // Primary Button
          ErplyPrimaryButton(
            text: 'Create Project',
            onPressed: () {
              // Create project logic
            },
          ),
        ],
      ),
    );
  }
}
```

## Best Practices

### Performance Optimization
1. Use `ErplyThemeRegistry` to preregister themes
2. Leverage Riverpod for efficient state management
3. Use responsive scaling factors for typography
4. Minimize widget rebuilds

### Accessibility Considerations
- Ensure sufficient color contrast
- Use scalable typography
- Provide semantic labels for interactive components

### Theming Tips
- Create a consistent color palette
- Use `copyWith` for theme variations
- Implement light and dark theme variants
- Consider different screen size scaling
