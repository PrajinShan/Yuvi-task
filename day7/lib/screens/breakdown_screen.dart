import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/gauge_painter.dart';
import '../widgets/ring_painter.dart';
import '../widgets/water_painter.dart';

/// The "Daily Breakdown" screen: one big calorie gauge card, tinted macro
/// chips, a water card, and the health score with nutrient rows — all on a
/// lavender background, matching the day6 mockup.
class BreakdownScreen extends StatelessWidget {
  const BreakdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.breakdownBg,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              _Header(),
              SizedBox(height: 20),
              _MacroCard(),
              SizedBox(height: 16),
              _WaterCard(),
              SizedBox(height: 16),
              _HealthScoreCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _RoundButton(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.chevron_left_rounded, size: 24),
        ),
        const Expanded(
          child: Center(
            child: Text('Daily Breakdown', style: AppText.sectionTitle),
          ),
        ),
        const _RoundButton(
          onTap: null,
          child: Icon(Icons.more_vert_rounded, size: 20),
        ),
      ],
    );
  }
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.card,
          shape: BoxShape.circle,
        ),
        child: IconTheme(
          data: IconThemeData(color: AppColors.ink),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _MacroCard extends StatelessWidget {
  const _MacroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 210,
                  height: 210,
                  child: CustomPaint(
                    painter: GaugePainter(
                      progress: 460 / 1600,
                      stroke: 16,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: '460',
                              style: AppText.statValue.copyWith(fontSize: 24),
                              children: [
                                TextSpan(
                                  text: ' / 1600',
                                  style: AppText.statValue.copyWith(
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text('Calories', style: AppText.label1),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.edit_outlined, size: 18, color: AppColors.ink),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: _MacroChip(
                  value: '34 g',
                  label: 'Protein',
                  bg: AppColors.chipOrangeBg,
                  fg: AppColors.chipOrangeText,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MacroChip(
                  value: '44 g',
                  label: 'Carbs',
                  bg: AppColors.chipPurpleBg,
                  fg: AppColors.chipPurpleText,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MacroChip(
                  value: '15 g',
                  label: 'Fats',
                  bg: AppColors.chipGreenBg,
                  fg: AppColors.chipGreenText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroChip extends StatelessWidget {
  const _MacroChip({
    required this.value,
    required this.label,
    required this.bg,
    required this.fg,
  });

  final String value;
  final String label;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: fg)),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppText.label.copyWith(fontSize: 13)),
      ],
    );
  }
}

class _WaterCard extends StatelessWidget {
  const _WaterCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Water', style: AppText.label),
                SizedBox(height: 4),
                Text('500/1947 ml', style: AppText.statSmall),
              ],
            ),
          ),
          // Custom Wavy Water Icon Widget
          WaterWidget(progress: 500 / 1947),
        ],
      ),
    );
  }
}

class _HealthScoreCard extends StatelessWidget {
  const _HealthScoreCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Health Score', style: AppText.label),
                    SizedBox(height: 2),
                    Text('Good', style: AppText.sectionTitle),
                  ],
                ),
              ),
              SizedBox(
                width: 46,
                height: 46,
                child: CustomPaint(
                  painter: RingPainter(
                    progress: 0.7,
                    trackColor: AppColors.ringTrack,
                    arcColor: AppColors.healthGreen,
                    stroke: 5,
                  ),
                  child: const Center(
                    child: Text(
                      '7/10',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const _NutrientRow(
            icon: Icons.grass_rounded,
            name: 'Fiber',
            value: '6g',
            good: false,
          ),
          const _NutrientRow(
            icon: Icons.set_meal_rounded,
            name: 'Net Crabs',
            value: '66g',
            good: true,
          ),
          const _NutrientRow(
            icon: Icons.cookie,
            name: 'Sugar',
            value: '20g',
            good: false,
          ),
          const _NutrientRow(
            icon: Icons.water_drop_rounded,
            name: 'Sodium',
            value: '1244mg',
            good: false,
            muted: true,
          ),
        ],
      ),
    );
  }
}

class _NutrientRow extends StatelessWidget {
  const _NutrientRow({
    required this.icon,
    required this.name,
    required this.value,
    required this.good,
    this.muted = false,
  });

  final IconData icon;
  final String name;
  final String value;
  final bool good;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color.fromARGB(255, 96, 96, 96)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 74, 74, 74)),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color:  Color.fromARGB(255, 74, 74, 74)),
          ),
          const SizedBox(width: 8),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: good ? AppColors.dotGreen : AppColors.dotRed,
            ),
          ),
        ],
      ),
    );
  }
}
