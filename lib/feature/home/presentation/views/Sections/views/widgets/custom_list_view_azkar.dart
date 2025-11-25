import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/zkar_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewAzkar extends StatelessWidget {
  CustomListViewAzkar({super.key});
  final List<Map<String, dynamic>> azkarList = [
    {
      "text": "أذكار الصباح",
      "route": "/azkardetails",
      "icon": Icons.wb_sunny_rounded,
    },
    {
      "text": "أذكار المساء",
      "route": "/eveningAzkar",
      "icon": Icons.nights_stay_rounded,
    },
    {"text": "أذكار النوم", "route": "/sleepAzkar", "icon": Icons.bed_rounded},
    {
      "text": "أذكار المسجد",
      "route": "/mosqueAzkar",
      "icon": Icons.mosque_rounded,
    },
    {
      "text": "أذكار الوضوء",
      "route": "/wuduAzkar",
      "icon": Icons.water_drop_rounded,
    },
    {
      "text": "أذكار الطعام",
      "route": "/foodAzkar",
      "icon": Icons.restaurant_rounded,
    },
    {
      "text": "أذكار الاستيقاظ",
      "route": "/wakeupAzkar",
      "icon": Icons.alarm_rounded,
    },
    {"text": "أذكار المنزل", "route": "/homeAzkar", "icon": Icons.home_rounded},
    {
      "text": "أذكار بعد الصلاة",
      "route": "/afterPrayerAzkar",
      "icon": Icons.front_hand_rounded,
    },
    {
      "text": "أذكار الأذان",
      "route": "/adhanAzkar",
      "icon": Icons.volume_up_rounded,
    },
    {
      "text": "أذكار الحج والعمرة",
      "route": "/hajjUmrahAzkar",
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
            GoRouter.of(context).push(azkar["route"] as String);
          },
        );
      },
    );
  }
}
