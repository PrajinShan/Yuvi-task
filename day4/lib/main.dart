import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const YuviTaskApp());
}

/// Root widget. Keeps global theme minimal — components style themselves
/// through the shared tokens in lib/theme.
class YuviTaskApp extends StatelessWidget {
  const YuviTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuvi Task — Day 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.scaffold,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.headerTop,
        ).copyWith(surface: AppColors.card),
      ),
      home: const HomeScreen(),
    );
  }
}
