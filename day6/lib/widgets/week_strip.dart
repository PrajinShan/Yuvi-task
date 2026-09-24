import 'package:flutter/material.dart';
import 'day_chip.dart';

/// The 7-day row: Wed 11 -> Tue 17, Sat 14 selected (purple), Fri 13 dashed border.
class WeekStrip extends StatelessWidget {
  const WeekStrip({super.key});

  @override
  Widget build(BuildContext context) {
    // Record tuple format: (day, date, selected, dashed, checked)
    const days = [
      ('Wed', '11', false, false, true),
      ('Thu', '12', false, false, true),
      ('Fri', '13', false, true, false),
      ('Sat', '14', true, false, false),
      ('Sun', '15', false, false, false),
      ('Mon', '16', false, false, false),
      ('Tue', '17', false, false, false),
    ];

    return Row(
      spacing: 3,
      children: [
        for (final (day, date, selected, dashed, checked) in days)
          Expanded(
            child: DayChip(
              day: day,
              date: date,
              selected: selected,
              dashed: dashed,
              checked: checked,
            ),
          ),
      ],
    );
  }
}