import 'package:flutter/material.dart';
import 'package:erply_ui/erply_ui.dart';

import '../widgets/erply_scaffold.dart';

class ResponsiveShowcase extends StatelessWidget {
  const ResponsiveShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ErplyScaffold(
      title: 'Responsive Showcase',
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use responsive value
          final boxWidth = ErplyResponsiveValue(
            context,
            defaultValue: 300,
            valueWhen: const [
              Condition.smallerThan(name: TABLET, value: 200),
              Condition.smallerThan(name: DESKTOP, value: 300),
            ],
          ).value?.toDouble();

          return Center(
            child: Container(
              width: boxWidth,
              height: 200,
              color: Theme.of(context).colorScheme.primary,
              child: const Center(
                child: Text(
                  'Responsive Container',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
