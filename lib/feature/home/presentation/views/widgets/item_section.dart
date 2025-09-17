import 'package:al_rafiq/core/utils/helper/class_size.dart';
import 'package:flutter/material.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: ScreenSize.height(context) * .13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: 28),
          ),
        ),
      ),
    );
  }
}
