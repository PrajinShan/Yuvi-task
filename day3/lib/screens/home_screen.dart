import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/goal_card.dart';
import '../widgets/header_card.dart';
import '../widgets/meal_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        gradient: RadialGradient(
        center: Alignment(0.0, -1.0), // Center of the glow at the top-middle edge
        radius: 0.9,                  // Adjust this value to shrink or enlarge the circle
        colors: [
           Color.fromARGB(255, 134, 82, 247), // Strong purple center glow
           Color.fromARGB(255, 228, 217, 243), // Soft lavender transition
           Color(0xFFF6F5FA),                 // Base background color
        ],
        stops: [0.0, 0.4, 0.5],
      ),
      ),
        child: SafeArea(
          child: Stack(
            children: [
              // Scrollable Content
              SingleChildScrollView(
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

              // Floating Glass Navigation Bar
              const FloatingBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}