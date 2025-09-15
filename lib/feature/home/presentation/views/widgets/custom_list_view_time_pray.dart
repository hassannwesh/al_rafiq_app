import 'package:al_rafiq/core/utils/helper/class_size.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/custom_time_pray_item.dart';
import 'package:flutter/material.dart';

class CustomListViewTimePray extends StatelessWidget {
  const CustomListViewTimePray({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height(context) * .1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CustomTimePrayItem(),
          );
        },
      ),
    );
  }
}
