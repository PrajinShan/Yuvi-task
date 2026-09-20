import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';

/// One weekday chip in the horizontal strip.
///
/// The mockup shows Wed..Tue with dates 11..17; the selected day is a dark
/// pill with white text, the rest are plain labels.
class DayChip extends StatelessWidget {
  const DayChip({
    required this.name,
    required this.date,
    required this.selected,
    super.key,
  });

  final String name;
  final String date;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final background =
        selected ? const Color(0xFF16110E) : Colors.transparent;
    final nameStyle = selected
        ? AppText.chipSelected
        : AppText.chip;
    final dateStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
      color: selected ? Colors.white : AppColors.ink,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: nameStyle),
          const SizedBox(height: 4),
          Text(date, style: dateStyle),
        ],
      ),
    );
  }
}
