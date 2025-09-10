import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});
  final Animation<Offset> slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            'الرفيق.. صحبةٌ على الطريق',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
