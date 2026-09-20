import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/goal_card.dart';
import '../widgets/header_card.dart';
import '../widgets/week_strip.dart';

/// Screen 1 of the mockup. Day 2 adds the week strip and goal card.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
          children: const [
            HeaderCard(),
            SizedBox(height: 20),
            WeekStrip(),
            SizedBox(height: 20),
            GoalCard(),
            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
