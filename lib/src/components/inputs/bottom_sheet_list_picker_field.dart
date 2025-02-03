import 'package:flutter/material.dart';

class ErplyPickerItem {
  final String label;
  final String value;

  const ErplyPickerItem({
    required this.label,
    required this.value,
  });
}

class ErplyBottomSheetListPickerFormField extends StatefulWidget {
  const ErplyBottomSheetListPickerFormField({
    super.key,
    required this.data,
    this.title,
    this.searchHint,
    this.onSaved,
    this.initialValue,
    this.autovalidate = true,
    this.validator,
    this.emptyStateMessage = 'No items found',
    this.loadingMessage = 'Loading...',
  });

  final bool autovalidate;
  final List<ErplyPickerItem> data;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final String? title;
  final String? searchHint;
  final FormFieldValidator<String>? validator;
  final String emptyStateMessage;
  final String loadingMessage;

  @override
  ErplyBottomSheetListPickerFormFieldState createState() =>
      ErplyBottomSheetListPickerFormFieldState();
}

class ErplyBottomSheetListPickerFormFieldState
    extends State<ErplyBottomSheetListPickerFormField> {
  List<ErplyPickerItem>? searchableList;
  ErplyPickerItem? selectedItem;
  String? textFilter;

  final _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchableList = widget.data;
    if (widget.initialValue != null) {
      try {
        selectedItem = searchableList?.firstWhere(
          (element) => element.value == widget.initialValue,
        );
      } catch (e) {
        // If no matching item is found, set selectedItem to null
        selectedItem = null;
      }
    }
  }

  void _showPicker(FormFieldState<String> state) {
    final themeData = Theme.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      builder: (ctx) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        widget.title!,
                        style: themeData.textTheme.titleMedium,
                      ),
                    ),
                  TextField(
                    style: themeData.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: widget.searchHint ?? 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: themeData.colorScheme.surface,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    controller: _searchController,
                    onChanged: (text) {
                      setState(() {
                        textFilter = text;
                        searchableList = text.isEmpty
                            ? widget.data
                            : widget.data.where(
                                (item) {
                                  final String value = item.label.toLowerCase();
                                  return value.contains(text.toLowerCase());
                                },
                              ).toList();
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            Expanded(
              child: _buildListContent(state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListContent(FormFieldState<String> state) {
    final themeData = Theme.of(context);
    if (searchableList == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                widget.loadingMessage,
                style: themeData.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
    }

    if (searchableList!.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.emptyStateMessage,
            style: themeData.textTheme.bodyMedium?.copyWith(
              color: themeData.colorScheme.onSurface.withValues(
                alpha: 0.6,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: searchableList?.length ?? 0,
      itemBuilder: (ctx, i) {
        final item = searchableList?[i];

        return Column(
          children: <Widget>[
            RadioListTile<String>(
              title: Text(
                item?.label ?? '',
                style: themeData.textTheme.bodyMedium,
              ),
              value: item?.value ?? '',
              groupValue: state.value,
              activeColor: themeData.colorScheme.primary,
              onChanged: (value) {
                state.didChange(value);
                setState(() {
                  selectedItem = item;
                });
                Navigator.of(context).pop();
              },
              dense: true,
            ),
            Divider(
              height: 0,
              color: themeData.dividerColor.withValues(alpha: 0.5),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: widget.onSaved,
      validator: widget.validator,
      initialValue: widget.initialValue,
      autovalidateMode: (widget.autovalidate)
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      builder: (FormFieldState<String> state) {
        final themeData = Theme.of(context);
        return InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => _showPicker(state),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeData.inputDecorationTheme.fillColor,
                  border: Border.all(
                    width: 0.9,
                    color: !state.hasError
                        ? themeData.dividerColor
                        : themeData.colorScheme.error,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        child: Text(
                          selectedItem != null ? selectedItem!.label : '',
                          style: themeData.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      splashRadius: 16,
                      onPressed: () => _showPicker(state),
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                    ),
                  ],
                ),
              ),
              if (state.hasError)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 8,
                  ),
                  child: Text(
                    state.errorText ?? 'Error',
                    style: themeData.textTheme.bodySmall?.copyWith(
                      color: themeData.colorScheme.error,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
