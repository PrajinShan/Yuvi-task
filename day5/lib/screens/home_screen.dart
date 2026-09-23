import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/goal_card.dart';
import '../widgets/header_card.dart';
import '../widgets/meal_card.dart';
import 'breakdown_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -1.0),
            radius: 0.9,
            colors: [
              Color.fromARGB(255, 134, 82, 247),
              Color.fromARGB(255, 228, 217, 243),
              Color(0xFFF6F5FA),
            ],
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // 1. Scrollable Content (takes up whole screen)
              SingleChildScrollView(
                // Bottom padding (100) ensures scrollable items aren't hidden behind the floating bar
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    HeaderCard(),
                    SizedBox(height: 16),
                    GoalCard(),
                    SizedBox(height: 16),
                    MealSection(),
                  ],
                ),
              ),

              // 2. Floating Glass Navigation Bar anchored at the bottom
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: FloatingBottomNavBar(
                  currentIndex: 0,
                  onTap: (index) {
                    // The pie-chart button is the 4th item (index 3).
                    if (index == 3) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const BreakdownScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}