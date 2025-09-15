import 'package:al_rafiq/feature/home/presentation/views/widgets/custom_list_view_time_pray.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/next_pray_widget.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/prayer_time_update_widget.dart';
import 'package:flutter/material.dart';

class TimePraySection extends StatelessWidget {
  const TimePraySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  NextPrayWidget(),
                  SizedBox(height: 15),
                  PrayerTimeUpdateWidget(),
                  SizedBox(height: 15),
                  CustomListViewTimePray(),
                ],
              );
  }
}