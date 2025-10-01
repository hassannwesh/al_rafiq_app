import 'package:flutter/material.dart';

class CustomTimePrayItem extends StatelessWidget {
  const CustomTimePrayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : MediaQuery.of(context).size.height * 0.1;

        const double basePadding = 8.0;
        final double innerHeight = (availableHeight - basePadding * 2).clamp(
          24,
          200,
        );

        final double titleFontSize = innerHeight * 0.5; // max 28 later
        final double timeFontSize = innerHeight * 0.32; // max 18 later

        final textTheme = Theme.of(context).textTheme;

        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(basePadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'الفجر',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: titleFontSize.clamp(16, 28).toDouble(),
                  ),
                ),
                SizedBox(height: innerHeight * 0.06),
                Text(
                  '5:10 Am',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: timeFontSize.clamp(12, 18).toDouble(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
