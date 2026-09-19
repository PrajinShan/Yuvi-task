import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/header_card.dart';

/// Screen 1 of the mockup. Day 1 ships the scaffold + header card.
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
            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
