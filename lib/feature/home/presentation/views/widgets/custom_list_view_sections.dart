import 'package:al_rafiq/feature/home/presentation/views/widgets/item_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewSections extends StatelessWidget {
  CustomListViewSections({super.key});
  final List<Map<String, String>> sections = [
    {"text": "الأذكار", "route": "/azkarview"},
    {"text": "الأذكار الخاصة", "route": "/userAzkarView"},
    {"text": "القرآن الكريم", "route": "/quranview"},
    {"text": "أسماء الله الحسنى", "route": "/namesview"},
    {"text": "سيرة النبي ﷺ", "route": "/prophetView"},
    {"text": "الأربعين النووية", "route": "/prophetView"},
    {"text": "سير الصحابة", "route": "/sahabaView"},
    {"text": "سير الصحابيات", "route": "/sahabiyatView"},
    {"text": "قصص الأنبياء", "route": "/anbiaView"},
    {"text": "الأدعية", "route": "/duaview"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عمودين
        crossAxisSpacing: 10, // مسافة بين الأعمدة
        mainAxisSpacing: 1, // مسافة بين الصفوف
        childAspectRatio: 1.5, // ظبط النسبة حسب الشكل اللي عايزه
      ),
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];
        return ItemSection(
          text: section["text"]!,
          onTap: () {
            GoRouter.of(context).push(section["route"]!);
          },
        );
      },
    );
  }
}
