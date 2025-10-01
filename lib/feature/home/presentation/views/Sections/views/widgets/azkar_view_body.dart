import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/zkar_item.dart';
import 'package:flutter/material.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SizedBox(child: ZkarItem()),
        );
      },
    );
  }
}
