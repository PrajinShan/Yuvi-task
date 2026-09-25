import 'dart:math' as math;
import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  RingPainter({
    required this.progress,
    required this.trackColor,
    required this.arcColor,
    required this.stroke,
    this.cap = StrokeCap.round,
    this.startAngle = math.pi * 0.75, // Bottom-left start
    this.sweepScale = 1.5,            // 270-degree arc
  })  : _trackPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke
          ..color = trackColor
          ..strokeCap = cap,
        _arcPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke // Keeps stroke width uniform with the track
          ..color = arcColor
          ..strokeCap = cap;

  final double progress;
  final Color trackColor;
  final Color arcColor;
  final double stroke;
  final StrokeCap cap;
  final double startAngle;
  final double sweepScale;

  late final Paint _trackPaint;
  late final Paint _arcPaint;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (math.min(size.width, size.height) - stroke) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Total track angle (e.g., pi * 1.5 = 270 degrees)
    final totalTrackSweep = math.pi * sweepScale;

    // 1. DRAW BACKGROUND TRACK ARC (with rounded ends)
    canvas.drawArc(
      rect,
      startAngle,
      totalTrackSweep,
      false,
      _trackPaint,
    );

    // 2. DRAW ACTIVE PROGRESS ARC (proportionate to progress)
    if (progress > 0) {
      final activeSweep = totalTrackSweep * progress.clamp(0.0, 1.0);
      canvas.drawArc(
        rect,
        startAngle,
        activeSweep,
        false,
        _arcPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.arcColor != arcColor ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.stroke != stroke ||
      oldDelegate.startAngle != startAngle ||
      oldDelegate.sweepScale != sweepScale;
}

class DashedCirclePainter extends CustomPainter {
  const DashedCirclePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..color = const Color(0xFFB49CEF);

    final radius = (math.min(size.width, size.height) - 1.4) / 2;
    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: radius);

    const dashCount = 14;
    const full = 2 * math.pi;
    const dashArc = full / (dashCount * 1.9);

    for (var i = 0; i < dashCount; i++) {
      canvas.drawArc(rect, i * full / dashCount, dashArc, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant DashedCirclePainter oldDelegate) => false;
}