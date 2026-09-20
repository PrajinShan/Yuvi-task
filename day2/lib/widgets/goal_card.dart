import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import 'ring_painter.dart';

/// The "Today's Goal" white card: calorie ring on the left, three macro
/// mini-rings on the right, macro legend underneath.
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
          Text("Today's Goal", style: AppText.sectionTitle),
          const SizedBox(height: 16),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CalorieRing(),
              SizedBox(width: 18),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: MacroRing(label: 'Protein left', grams: '34g', fraction: 0.72),
                    ),
                    Expanded(
                      child: MacroRing(label: 'Carbs left', grams: '25g', fraction: 0.55),
                    ),
                    Expanded(
                      child: MacroRing(label: 'Fat over', grams: '14g', fraction: 0.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Big ring: 460 / 1600 kcal with the flame icon centred.
class CalorieRing extends StatelessWidget {
  const CalorieRing({super.key});

  @override
  Widget build(BuildContext context) {
    const progress = 460 / 1600;

    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(120, 120),
            painter: RingPainter(
              progress: progress,
              trackColor: AppColors.ringTrack,
              progressColor: AppColors.ink,
              strokeWidth: 9,
            ),
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.local_fire_department_outlined, size: 20),
              SizedBox(height: 2),
              Text('460/1600', style: AppText.label),
            ],
          ),
        ],
      ),
    );
  }
}

/// Small ring + grams + caption stacked vertically.
class MacroRing extends StatelessWidget {
  const MacroRing({
    required this.label,
    required this.grams,
    required this.fraction,
    super.key,
  });

  final String label;
  final String grams;
  final double fraction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(grams, style: AppText.body),
        const SizedBox(height: 6),
        SizedBox(
          width: 54,
          height: 54,
          child: CustomPaint(
            painter: RingPainter(
              progress: fraction,
              trackColor: AppColors.ringTrack,
              progressColor: AppColors.progressGreen,
              strokeWidth: 5,
            ),
          ),
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(label, style: AppText.label, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
