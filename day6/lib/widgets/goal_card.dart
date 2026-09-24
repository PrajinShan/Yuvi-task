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
                        stroke: 8,
                        startAngle: math.pi * 0.75,
                        sweepScale: 1.35,
                      ),
                    ),

                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: MacroCard(
                  grams: '34g',
                  label: 'Protein left',
                  progress: 0.65,
                  arcColor: const Color(0xFFFFB74D),
                  icon: Image.asset('assets/images/chicken.png'),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: MacroCard(
                  grams: '25g',
                  label: 'Carbs left',
                  progress: 0.45,
                  arcColor: const Color(0xFF9065FF),
                  icon: Image.asset('assets/images/fiber.png'),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: MacroCard(
                  grams: '14g',
                  label: 'Fat over',
                  progress: 0.55,
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
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          TextSpan(
            text: '/1600',
            style: AppText.statValue.copyWith(
              fontSize: 20,
              color: Colors.grey,
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

  // Changed from IconData to Widget
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 8,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Text(
            grams,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: 44,
            height: 44,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(44, 44),
                  painter: RingPainter(
                    progress: progress,
                    trackColor: const Color(0xFFEBEBEB),
                    arcColor: arcColor,
                    stroke: 5,
                    startAngle: math.pi * 0.75,
                    sweepScale: 1.35,
                  ),
                ),

                SizedBox(
                  width: 18,
                  height: 18,
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