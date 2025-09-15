import 'package:flutter/material.dart';

class CustomBottomUpdate extends StatelessWidget {
  const CustomBottomUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 30,
        width: 130,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [Text('تحديث المواقيت '), Spacer(), Icon(Icons.refresh)],
          ),
        ),
      ),
    );
  }
}
