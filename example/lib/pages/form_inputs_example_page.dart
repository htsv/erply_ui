import 'package:erply_ui_example/widgets/erply_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:erply_ui/erply_ui.dart';

class FormInputsExamplePage extends StatefulWidget {
  const FormInputsExamplePage({Key? key}) : super(key: key);

  @override
  State<FormInputsExamplePage> createState() => _FormInputsExamplePageState();
}

class _FormInputsExamplePageState extends State<FormInputsExamplePage> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAccepted = false;
  bool _newsletterSubscribed = false;
  bool? _privacyPreference;

  @override
  Widget build(BuildContext context) {
    return ErplyScaffold(
      title: 'Form Inputs Example',
      body: SingleChildScrollView(
        padding: ErplyTokens.paddingMd,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Basic Checkbox with Title
              ErplyCheckboxFormField(
                context: context,
                title: const Text('I accept the Terms and Conditions'),
                initialValue: _termsAccepted,
                validator: (value) =>
                    value == true ? null : 'Please accept the terms',
                onSaved: (value) => _termsAccepted = value ?? false,
                semanticLabel: 'Terms and Conditions Checkbox',
              ),
              ErplyTokens.verticalSizedBoxSm,

              // Customized Checkbox
              ErplyCheckboxFormField(
                context: context,
                title: const Text('Subscribe to Newsletter'),
                initialValue: _newsletterSubscribed,
                activeColor: Colors.green,
                checkColor: Colors.white,
                onSaved: (value) => _newsletterSubscribed = value ?? false,
                semanticLabel: 'Newsletter Subscription Checkbox',
              ),
              context.verticalSizedBoxMd,

              // Checkbox with Custom Error Styling
              ErplyCheckboxFormField(
                context: context,
                title: const Text('Receive Marketing Communications'),
                validator: (value) =>
                    value == true ? null : 'Please opt-in for marketing',
                errorTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontStyle: FontStyle.italic,
                ),
                semanticLabel: 'Marketing Communications Checkbox',
              ),
              ErplyTokens.sizedBoxSm,

              // Tristate Checkbox Example
              ErplyCheckboxFormField(
                context: context,
                title: const Text('Privacy Preferences'),
                tristate: true,
                initialValue: _privacyPreference,
                onSaved: (value) => _privacyPreference = value,
                validator: (value) => null,
                semanticLabel: 'Privacy Preference Checkbox',
              ),

              // Optional: Display current tristate value
              Padding(
                padding: ErplyTokens.verticalPaddingSm,
                child: Text(
                  'Current Privacy Preference: ${_getPrivacyPreferenceText()}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              Row(
                children: [
                  const Text('Horizontal Spacing:'),
                  ErplyTokens.horizontalSizedBoxSm,
                  const Icon(Icons.check_circle),
                  context.horizontalSizedBoxMd,
                  const Icon(Icons.check_circle_outline),
                ],
              ),

              ErplyTokens.sizedBoxLg,
              ErplyPrimaryButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Form Submitted:\n'
                            'Terms Accepted: $_termsAccepted\n'
                            'Newsletter: $_newsletterSubscribed\n'
                            'Privacy: ${_getPrivacyPreferenceText()}'),
                      ),
                    );
                  }
                },
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to convert tristate value to readable text
  String _getPrivacyPreferenceText() {
    switch (_privacyPreference) {
      case true:
        return 'Accepted';
      case false:
        return 'Rejected';
      case null:
        return 'Undecided';
    }
  }
}
