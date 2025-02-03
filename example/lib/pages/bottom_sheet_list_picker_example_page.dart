import 'package:flutter/material.dart';
import 'package:erply_ui/erply_ui.dart';

import '../widgets/erply_scaffold.dart';

class BottomSheetListPickerExamplePage extends StatelessWidget {
  const BottomSheetListPickerExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the picker
    final List<ErplyPickerItem> countries = [
      const ErplyPickerItem(label: 'United States', value: 'US'),
      const ErplyPickerItem(label: 'United Kingdom', value: 'UK'),
      const ErplyPickerItem(label: 'Canada', value: 'CA'),
      const ErplyPickerItem(label: 'Australia', value: 'AU'),
      const ErplyPickerItem(label: 'Germany', value: 'DE'),
      const ErplyPickerItem(label: 'France', value: 'FR'),
      const ErplyPickerItem(label: 'Japan', value: 'JP'),
      const ErplyPickerItem(label: 'Brazil', value: 'BR'),
      const ErplyPickerItem(label: 'India', value: 'IN'),
      const ErplyPickerItem(label: 'China', value: 'CN'),
    ];

    return ErplyScaffold(
      title: 'Bottom Sheet List Picker',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bottom Sheet List Picker Demos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Basic Usage Section
              const Text(
                'Basic Usage',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Form(
                child: Column(
                  children: [
                    // Basic usage
                    ErplyBottomSheetListPickerFormField(
                      data: countries,
                      title: 'Select Country',
                      searchHint: 'Search countries...',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a country';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Selected country code: $value')),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    // With initial value
                    const Text(
                      'With Initial Value',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ErplyBottomSheetListPickerFormField(
                      data: countries,
                      initialValue: 'US',
                      title: 'Select Country (with default)',
                      searchHint: 'Search countries...',
                    ),
                    const SizedBox(height: 16),

                    // Empty State Example
                    const Text(
                      'Empty State Example',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const ErplyBottomSheetListPickerFormField(
                      data: [], // Empty list to show empty state
                      title: 'Empty List Example',
                      searchHint: 'Search...',
                      emptyStateMessage: 'No countries available',
                      loadingMessage: 'Fetching countries...',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
