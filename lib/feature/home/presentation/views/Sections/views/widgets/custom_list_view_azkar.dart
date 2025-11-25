import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/zkar_item.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewAzkar extends StatelessWidget {
  CustomListViewAzkar({super.key});
  final List<Map<String, dynamic>> azkarList = [
    {
      "text": "أذكار الصباح",
      "filename": "morning_azkar",
      "icon": Icons.wb_sunny_rounded,
    },
    {
      "text": "أذكار المساء",
      "filename": "evening_azkar",
      "icon": Icons.nights_stay_rounded,
    },
    {
      "text": "أذكار النوم",
      "filename": "sleep_azkar",
      "icon": Icons.bed_rounded,
    },
    {
      "text": "أذكار المسجد",
      "filename": "mosque_azkar",
      "icon": Icons.mosque_rounded,
    },
    {
      "text": "أذكار الوضوء",
      "filename": "wudu_azkar",
      "icon": Icons.water_drop_rounded,
    },
    {
      "text": "أذكار الطعام",
      "filename": "food_azkar",
      "icon": Icons.restaurant_rounded,
    },
    {
      "text": "أذكار الاستيقاظ",
      "filename": "wakeup_azkar",
      "icon": Icons.alarm_rounded,
    },
    {
      "text": "أذكار المنزل",
      "filename": "home_azkar",
      "icon": Icons.home_rounded,
    },
    {
      "text": "أذكار بعد الصلاة",
      "filename": "after_prayer_azkar",
      "icon": Icons.front_hand_rounded,
    },
    {
      "text": "أذكار الأذان",
      "filename": "adhan_azkar",
      "icon": Icons.volume_up_rounded,
    },
    {
      "text": "أذكار الحج والعمرة",
      "filename": "hajj_umrah_azkar",
      "icon": Icons.airplanemode_active_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: azkarList.length,
      itemBuilder: (context, index) {
        final azkar = azkarList[index];
        return ZkarItem(
          text: azkar["text"] as String,
          icon: azkar["icon"] as IconData,
          onTap: () {
            GoRouter.of(context).push(
              '/azkardetails',
              extra: {'title': azkar["text"], 'category': azkar["filename"]},
            );
          },
        );
      },
    );
  }
}
