import 'package:al_rafiq/feature/home/presentation/views/widgets/item_section.dart';
import 'package:flutter/material.dart';

class CustomListViewSections extends StatelessWidget {
  CustomListViewSections({super.key});

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
        return ItemSection(text: sections[index]);
      },
    );
  }

  final List<String> sections = [
    "أسماء الله الحسنى",
    "الأذكار",
    "الأدعية",
    "القرآن الكريم",
    "السيرة",
    "التفسير",
    "الحديث",
    "الفقه",
    "التجويد",
    "القصص",
  ];
}
