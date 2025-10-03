import 'package:al_rafiq/core/utils/helper/class_size.dart';
import 'package:flutter/material.dart';

class ZkarItem extends StatelessWidget {
  const ZkarItem({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * .11,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: ScreenSize.height(context) * .13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Theme.of(context).primaryColor.withOpacity(1),
                Theme.of(context).primaryColor.withOpacity(0.2),
              ],
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 26,
                color: Colors.white, // النص يبان بوضوح
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
