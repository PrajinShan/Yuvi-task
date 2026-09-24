import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import 'week_strip.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Changed Container to Padding and adjusted padding values
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Welcome Back', style: AppText.greeting),
                        const SizedBox(width: 4),
                        const Text('👋', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text('Stay On Track Today', style: AppText.headline),
                  ],
                ),
              ),
              const HeaderIconButton(icon: Icons.notifications_none_rounded),
              const SizedBox(width: 10),
              const AvatarBadge(),
            ],
          ),
          const SizedBox(height: 20, width: 15),
          const WeekStrip(),
        ],
      ),
    );
  }
}

class HeaderIconButton extends StatelessWidget {
  const HeaderIconButton({required this.icon, super.key});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: AppColors.ink),
    );
  }
}

class AvatarBadge extends StatelessWidget {
  const AvatarBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        image: const DecorationImage(
          image: AssetImage('assets/images/avatar.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}