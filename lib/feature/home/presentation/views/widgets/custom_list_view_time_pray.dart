import 'package:al_rafiq/core/utils/helper/class_size.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/custom_time_pray_item.dart';
import 'package:flutter/material.dart';

class CustomListViewTimePray extends StatelessWidget {
  const CustomListViewTimePray({super.key});

  @override
  Widget build(BuildContext context) {
    final double listHeight = ScreenSize.height(context) * .11;
    final double itemWidth =
        MediaQuery.of(context).size.width * 0.22; // حوالي 22% من العرض

    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: SizedBox(
              width: itemWidth.clamp(
                90.0,
                140.0,
              ), // يحافظ على اتساق العنصر عبر الأجهزة
              child: CustomTimePrayItem(),
            ),
          );
        },
      ),
    );
  }
}
