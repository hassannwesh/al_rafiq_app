import 'package:adhan/adhan.dart';
import 'package:al_rafiq/core/manager/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:al_rafiq/core/manager/prayer_time_cubit/prayer_time_state.dart';
import 'package:al_rafiq/core/utils/helper/class_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class NextPrayWidget extends StatelessWidget {
  const NextPrayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null) {
          return Container(
            height: ScreenSize.height(context) * .3,
            width: ScreenSize.width(context) * .95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.errorContainer,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.errorMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (state.errorMessage!.contains('الإعدادات')) {
                      Geolocator.openAppSettings();
                    } else if (state.errorMessage!.contains('تفعيلها')) {
                      Geolocator.openLocationSettings();
                    }
                    context.read<PrayerTimeCubit>().getPrayerTimes();
                  },
                  child: const Text('تحديث / الإعدادات'),
                ),
              ],
            ),
          );
        }

        final nextPrayerName = _getPrayerName(state.nextPrayer);
        final remainingTime = _formatDuration(state.timeRemaining);

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
                'الصلاة القادمة : $nextPrayerName',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                'الوقت المتبقي: $remainingTime',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getPrayerName(Prayer? prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return 'الفجر';
      case Prayer.dhuhr:
        return 'الظهر';
      case Prayer.asr:
        return 'العصر';
      case Prayer.maghrib:
        return 'المغرب';
      case Prayer.isha:
        return 'العشاء';
      case Prayer.sunrise:
        return 'الشروق';
      default:
        return '';
    }
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) return '00:00:00';
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }
}
