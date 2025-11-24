import 'package:al_rafiq/core/utils/helper/class_size.dart';
import 'package:flutter/material.dart';

class NextPrayWidget extends StatelessWidget {
  const NextPrayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * .3,
      width: ScreenSize.width(context) * .95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'الصلاة القادمة : الفجر ',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: 30, color: Colors.white),
          ),
          Text(
            'الوقت المتبقي: 3:5:25',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
