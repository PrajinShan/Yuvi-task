import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'ring_painter.dart';

class DayChip extends StatelessWidget {
  const DayChip({
    required this.day,
    required this.date,
    this.selected = false,
    this.dashed = false,
    this.checked = false,
    super.key,
  });

  final String day;
  final String date;
  final bool selected;
  final bool dashed;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Day Name
          Text(
            day,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),

          // Date Circle with Badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                painter: dashed ? const DashedCirclePainter() : null,
                child: Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected
                        ? const Color(0xFF9D6EFF)
                        : (dashed ? Colors.transparent : Colors.white),
                  ),
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : AppColors.ink,
                    ),
                  ),
                ),
              ),

              // Checkmark Badge for completed days
              if (checked)
                Positioned(
                  top: -1,
                  right: -1,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Color(0xFF9D6EFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}