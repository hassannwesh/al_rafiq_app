import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/zkar_card.dart';
import 'package:flutter/material.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SizedBox(child: ZkarCard()),
        );
      },
    );
  }
}
