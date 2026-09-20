import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';

/// The purple gradient card at the top of screen 1.
///
/// Layout: [greeting + name] on the left, notification icon and avatar on
/// the right — matching the mockup's header block.
class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(24, 0, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.headerTop, AppColors.headerBottom],
        ),
      ),
      child: const Row(
        children: [
          Expanded(child: HeaderText()),
          SizedBox(width: 12),
          HeaderIconButton(icon: Icons.notifications_outlined),
          SizedBox(width: 10),
          AvatarBadge(),
        ],
      ),
    );
  }
}

/// Left side: small greeting over the bold name line.
class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Welcome Back', style: AppText.greeting),
        const SizedBox(height: 4),
        Text('Stay On Track Today', style: AppText.headline),
      ],
    );
  }
}

/// Circular translucent button used for the notification bell.
class HeaderIconButton extends StatelessWidget {
  const HeaderIconButton({required this.icon, super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Color(0x33FFFFFF),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 22, color: AppColors.ink),
    );
  }
}

/// Avatar photo cropped straight from the mockup.
class AvatarBadge extends StatelessWidget {
  const AvatarBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
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
