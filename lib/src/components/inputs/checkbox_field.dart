import 'package:flutter/material.dart';

/// A form-integrated checkbox with customizable appearance and validation
///
/// [title] is an optional widget displayed next to the checkbox
/// [context] is required for theme access
/// [initialValue] sets the initial checked state
/// [autovalidate] determines if validation occurs automatically
class ErplyCheckboxFormField extends FormField<bool> {
  ErplyCheckboxFormField({
    super.key,
    Widget? title,
    String? semanticLabel,
    required BuildContext context,
    super.onSaved,
    super.validator,
    bool? initialValue,
    bool autovalidate = false,
    bool emptyColor = true,
    // New customization options
    Color? activeColor,
    Color? checkColor,
    Color? fillColor,
    double? splashRadius,
    EdgeInsets? errorPadding,
    TextStyle? errorTextStyle,
    bool tristate = false,
  }) : super(
          initialValue: tristate ? initialValue : initialValue ?? false,
          autovalidateMode: autovalidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          builder: (FormFieldState<bool> state) {
            final themeData = Theme.of(context);
            final isError = state.hasError;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(
                      // Enhanced customization
                      value: state.value,
                      tristate: tristate,
                      onChanged: state.didChange,

                      // Styling and color configuration
                      activeColor: activeColor ?? themeData.colorScheme.primary,
                      checkColor: checkColor ?? themeData.colorScheme.onPrimary,
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.disabled)) {
                          return themeData.disabledColor;
                        }
                        if (states.contains(WidgetState.selected)) {
                          return fillColor ?? themeData.colorScheme.primary;
                        }
                        return themeData.colorScheme.surface;
                      }),

                      // Interaction and accessibility
                      splashRadius: splashRadius ?? 20,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,

                      // Semantic and accessibility
                      semanticLabel: semanticLabel,
                      isError: isError,
                    ),
                    if (title != null)
                      Flexible(
                        child: GestureDetector(
                          onTap: () => state.didChange(!(state.value ?? false)),
                          child: title,
                        ),
                      ),
                  ],
                ),
                if (isError)
                  Padding(
                    padding: errorPadding ??
                        const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      state.errorText ?? 'Invalid selection',
                      style: errorTextStyle ??
                          themeData.textTheme.bodySmall?.copyWith(
                            color: themeData.colorScheme.error,
                          ),
                    ),
                  )
              ],
            );
          },
        );
}
