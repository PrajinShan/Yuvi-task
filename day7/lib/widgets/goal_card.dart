import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import 'ring_painter.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Goal",
            style: AppText.sectionTitle,
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const CalorieText(),

              const Spacer(),

              SizedBox(
                width: 72,
                height: 72,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(72, 72),
                      painter: RingPainter(
                        progress: 0.35,
                        trackColor: const Color(0xFFF2F2F2),
                        arcColor: AppColors.ink,
                        stroke: 7,
                        startAngle: math.pi * 0.75, // Bottom-left start
                        sweepScale: 1.5,            // 270-degree horseshoe arc
                      ),
                    ),

                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Horizontal divider line
          Divider(
            color: Colors.grey.withValues(alpha: 0.15),
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: MacroCard(
                  grams: '34g',
                  label: 'Protein left',
                  progress: 0.35,
                  arcColor: const Color(0xFFFFB74D),
                  icon: Image.asset('assets/images/chicken.png'),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: MacroCard(
                  grams: '25g',
                  label: 'Carbs left',
                  progress: 0.25,
                  arcColor: const Color(0xFF9065FF),
                  icon: Image.asset('assets/images/fiber.png'),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: MacroCard(
                  grams: '14g',
                  label: 'Fat over',
                  progress: 0.20,
                  arcColor: const Color(0xFF4CAF50),
                  icon: Image.asset('assets/images/fat.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalorieText extends StatelessWidget {
  const CalorieText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '460',
            style: AppText.statValue.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          TextSpan(
            text: '/1600',
            style: AppText.statValue.copyWith(
              fontSize: 26,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}

class MacroCard extends StatelessWidget {
  const MacroCard({
    required this.grams,
    required this.label,
    required this.progress,
    required this.arcColor,
    required this.icon,
    super.key,
  });

  final String grams;
  final String label;
  final double progress;
  final Color arcColor;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Text(
            grams,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: 48,
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(48, 48),
                  painter: RingPainter(
                    progress: progress,
                    trackColor: const Color(0xFFEBEBEB),
                    arcColor: arcColor,
                    stroke: 5.5,
                    startAngle: math.pi * 0.75, // Bottom-left start
                    sweepScale: 1.5,            // 270-degree horseshoe arc
                  ),
                ),

                SizedBox(
                  width: 20,
                  height: 20,
                  child: icon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}