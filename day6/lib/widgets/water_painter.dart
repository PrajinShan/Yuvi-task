import 'dart:math';
import 'package:flutter/material.dart';

class WaterWidget extends StatelessWidget {
  final double progress; // Range 0.0 to 1.0

  const WaterWidget({super.key, this.progress = 500 / 1947});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(48, 48),
      painter: _WaterCardPainter(progress: progress.clamp(0.0, 1.0)),
    );
  }
}

class _WaterCardPainter extends CustomPainter {
  final double progress;

  _WaterCardPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2 - 3;
    final innerRadius = outerRadius - 6;

    // 1. Draw Outer Track Line (Light Gray)
    final trackPaint = Paint()
      ..color = const Color(0xFFF1F5F9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(center, outerRadius, trackPaint);

    // 2. Draw Outer Progress Arc (Purple Accent)
    final progressPaint = Paint()
      ..color = const Color(0xFF8B5CF6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // Start near top-left (-120deg) sweeping based on progress
    const startAngle = -120 * (pi / 180);
    final sweepAngle = (2 * pi * progress);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    // 3. Draw Inner Circle Background (Light Soft Lavender Tint)
    final innerBgPaint = Paint()
      ..color = const Color(0xFFF5F3FF)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, innerRadius, innerBgPaint);

    // 4. Draw Inner Wavy Liquid Fill (Blue)
    final innerClipPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: innerRadius));

    canvas.save();
    canvas.clipPath(innerClipPath);

    // Dynamic height level based on progress
    final waterY = (center.dy + innerRadius) - (innerRadius * 2 * progress);

    final wavePath = Path();
    wavePath.moveTo(center.dx - innerRadius, waterY);

    // Smooth cubic wave curve across the circle
    wavePath.cubicTo(
      center.dx - (innerRadius / 2)-6,
      waterY - 24,
      center.dx + (innerRadius / 2)+1,
      waterY +2.5,
      center.dx + innerRadius -1.4,
      waterY -9,
    );

    // Complete liquid block path
    wavePath.lineTo(center.dx + innerRadius, center.dy + innerRadius );
    wavePath.lineTo(center.dx - innerRadius, center.dy + innerRadius );
    wavePath.close();

    final waterPaint = Paint()
      ..color = const Color(0xFF4C63B6) // Deep blue water color
      ..style = PaintingStyle.fill;

    canvas.drawPath(wavePath, waterPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _WaterCardPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}