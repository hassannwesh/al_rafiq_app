import 'dart:ui';
import 'package:flutter/material.dart';

class ProgressBorderPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double width;

  ProgressBorderPainter({
    required this.progress,
    required this.color,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(16),
    );

    final Path path = Path()..addRRect(rRect);

    // Calculate total length of the path
    final PathMetric pathMetric = path.computeMetrics().first;
    final double totalLength = pathMetric.length;

    // Calculate length to draw based on progress
    final double drawLength = totalLength * progress;

    // Extract the sub-path to draw
    final Path drawPath = pathMetric.extractPath(0, drawLength);

    canvas.drawPath(drawPath, paint);
  }

  @override
  bool shouldRepaint(covariant ProgressBorderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.width != width;
  }
}
