import 'package:flutter/material.dart';

class CustomTimePrayItem extends StatelessWidget {
  const CustomTimePrayItem({
    super.key,
    required this.prayerName,
    required this.prayerTime,
    this.isNextPrayer = false,
  });

  final String prayerName;
  final String prayerTime;
  final bool isNextPrayer;

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
        final primaryColor = Theme.of(context).colorScheme.primary;

        return Container(
          decoration: BoxDecoration(
            color: isNextPrayer ? primaryColor : primaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
            border: isNextPrayer
                ? Border.all(color: Colors.white, width: 2)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(basePadding),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    prayerName,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: titleFontSize.clamp(16, 28).toDouble(),
                      color: Colors.white,
                      fontWeight: isNextPrayer
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: innerHeight * 0.06),
                  Text(
                    prayerTime,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: timeFontSize.clamp(12, 18).toDouble(),
                      color: Colors.white,
                      fontWeight: isNextPrayer
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
