import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/zkar_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewAzkar extends StatelessWidget {
  CustomListViewAzkar({super.key});
  final List<Map<String, String>> azkarList = [
    {"text": "أذكار الصباح", "route": "/azkardetails"},
    {"text": "أذكار المساء", "route": "/eveningAzkar"},
    {"text": "أذكار النوم", "route": "/sleepAzkar"},
    {"text": "أذكار المسجد", "route": "/mosqueAzkar"},
    {"text": "أذكار الوضوء", "route": "/wuduAzkar"},
    {"text": "أذكار الطعام", "route": "/foodAzkar"},
    {"text": "أذكار الاستيقاظ", "route": "/wakeupAzkar"},
    {"text": "أذكار المنزل", "route": "/homeAzkar"},
    {"text": "أذكار بعد الصلاة", "route": "/afterPrayerAzkar"},
    {"text": "أذكار الأذان", "route": "/adhanAzkar"},
    {"text": "أذكار الحج والعمرة", "route": "/hajjUmrahAzkar"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: azkarList.length,
      itemBuilder: (context, index) {
        final azkar = azkarList[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SizedBox(
            child: ZkarItem(
              text: azkar["text"]!,
              onTap: () {
                GoRouter.of(context).push(azkar["route"]!);
              },
            ),
          ),
        );
      },
    );
  }
}
