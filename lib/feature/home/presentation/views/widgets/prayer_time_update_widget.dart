import 'package:al_rafiq/feature/home/presentation/views/widgets/custom_bottom_update.dart';
import 'package:flutter/material.dart';

class PrayerTimeUpdateWidget extends StatelessWidget {
  const PrayerTimeUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'موقيت الصلاة ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 24),
        ),
        Spacer(),
        CustomBottomUpdate(),
      ],
    );
  }
}
