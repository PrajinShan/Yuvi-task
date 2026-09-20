import 'package:flutter/material.dart';

import 'day_chip.dart';

/// Horizontally scrolling weekday strip: Wed 11 .. Tue 17.
/// Friday is selected in the mockup.
class WeekStrip extends StatelessWidget {
  const WeekStrip({super.key});

  static const _days = [
    ('Wed', '11'),
    ('Thu', '12'),
    ('Fri', '13'),
    ('Sat', '14'),
    ('Sun', '15'),
    ('Mon', '16'),
    ('Tue', '17'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        separatorBuilder: (_, _) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final (name, date) = _days[index];
          return DayChip(
            name: name,
            date: date,
            selected: index == 2, // Friday
          );
        },
      ),
    );
  }
}
