import 'package:flutter/material.dart';

class CustomTimePrayItem extends StatelessWidget {
  const CustomTimePrayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'الفجر',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 28),
            ),
            Text(
              '5:10 Am',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
