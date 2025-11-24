import 'package:adhan/adhan.dart';
import 'package:al_rafiq/core/manager/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:al_rafiq/core/manager/prayer_time_cubit/prayer_time_state.dart';
import 'package:al_rafiq/core/utils/helper/class_size.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/custom_time_pray_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CustomListViewTimePray extends StatelessWidget {
  const CustomListViewTimePray({super.key});

  @override
  Widget build(BuildContext context) {
    final double listHeight = ScreenSize.height(context) * .11;
    final double itemWidth = MediaQuery.of(context).size.width * 0.22;

    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state.prayerTimes == null) {
          return const SizedBox.shrink();
        }

        final prayers = [
          Prayer.fajr,
          Prayer.sunrise,
          Prayer.dhuhr,
          Prayer.asr,
          Prayer.maghrib,
          Prayer.isha,
        ];

        return SizedBox(
          height: listHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: prayers.length,
            itemBuilder: (context, index) {
              final prayer = prayers[index];
              final time = state.prayerTimes!.timeForPrayer(prayer);
              final isNext = state.nextPrayer == prayer;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                  width: itemWidth.clamp(90.0, 140.0),
                  child: CustomTimePrayItem(
                    prayerName: _getPrayerName(prayer),
                    prayerTime: time != null
                        ? DateFormat.jm().format(time)
                        : '',
                    isNextPrayer: isNext,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  String _getPrayerName(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return 'الفجر';
      case Prayer.sunrise:
        return 'الشروق';
      case Prayer.dhuhr:
        return 'الظهر';
      case Prayer.asr:
        return 'العصر';
      case Prayer.maghrib:
        return 'المغرب';
      case Prayer.isha:
        return 'العشاء';
      default:
        return '';
    }
  }
}
