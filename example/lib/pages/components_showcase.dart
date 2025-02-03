import 'package:flutter/material.dart';
import 'package:erply_ui/erply_ui.dart';

import '../widgets/erply_scaffold.dart';
import 'bottom_sheet_list_picker_example_page.dart';
import 'form_inputs_example_page.dart';

class ComponentsShowcase extends StatelessWidget {
  const ComponentsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ErplyScaffold(
      title: 'Components Showcase',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Dialog Wrapper Example
            ElevatedButton(
              onPressed: () => _showErplyDialog(context),
              child: const Text('Show Erply Dialog'),
            ),

            // SizedBox Helpers
            Column(
              children: [
                ErplyTokens.verticalSizedBoxSm,
                const Text('Vertical Spacing Example'),
                ErplyTokens.verticalSizedBoxMd,
                const Text('More Spacing'),
              ],
            ),

            // Bottom Sheet Picker
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        const BottomSheetListPickerExamplePage()),
              ),
              child: const Text('Show Bottom Sheet Picker'),
            ),

            //
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const FormInputsExamplePage()),
              ),
              child: const Text('Form Inputs Example'),
            ),
          ],
        ),
      ),
    );
  }

  void _showErplyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ErplyDialogWrapper(
        isLargerThanMobile: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Erply Dialog',
                  style: Theme.of(context).textTheme.headlineMedium),
              const Text('This is a responsive dialog wrapper'),
            ],
          ),
        ),
      ),
    );
  }
}
