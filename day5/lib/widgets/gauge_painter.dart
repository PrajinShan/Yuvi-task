import 'dart:math';
import 'package:flutter/material.dart';

class GaugePainter extends CustomPainter {
  final double progress;
  final double stroke;

  GaugePainter({
    required this.progress,
    this.stroke = 16,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - stroke) / 2;

    // Start at bottom-left (135°) and sweep 270° clockwise to bottom-right
    const startAngle = 135 * (pi / 180);
    const totalSweep = 270 * (pi / 180);

    // 1. Draw Gray Background Track
    final bgPaint = Paint()
      ..color = const Color(0xFFEBEBEB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep,
      false,
      bgPaint,
    );

    // 2. Draw Active Black Progress Arc
    final activeSweep = totalSweep * progress.clamp(0.0, 1.0);

    final activePaint = Paint()
      ..color = const Color(0xFF141414)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    if (progress > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        activeSweep,
        false,
        activePaint,
      );

      // 3. Draw Tip Circle (Black ring with white hole)
      final currentTipAngle = startAngle + activeSweep;
      final tipCenter = Offset(
        center.dx + radius * cos(currentTipAngle),
        center.dy + radius * sin(currentTipAngle),
      );

      final outerTipPaint = Paint()..color = const Color(0xFF141414);
      final innerDotPaint = Paint()..color = Colors.white;

      // Outer black circle cap
      canvas.drawCircle(tipCenter, (stroke / 2) + 3, outerTipPaint);
      // Inner white dot
      canvas.drawCircle(tipCenter, 4.5, innerDotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.stroke != stroke;
  }
}