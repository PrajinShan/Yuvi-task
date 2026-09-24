import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class MealSection extends StatelessWidget {
  const MealSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Today's Meals", style: AppText.sectionTitle),
        SizedBox(height: 12),
        MealCard(
          name: 'Breakfast',
          kcal: '460-465 Kcal',
          images: [
            'assets/images/bmeal1.jpg',
             'assets/images/bmeal2.png',
             'assets/images/bmeal3.jpg',
          ],
        ),
        SizedBox(height: 10),
        MealCard(
          name: 'Lunch',
          kcal: 'Oats with fruits and nuts',
          images: [
            'assets/images/lmeal1.jpg',
            'assets/images/lmeal2.jpg',
            'assets/images/lmeal3.jpg',
          ],
        ),
        SizedBox(height: 10),
        MealCard(
          name: 'Dinner',
          kcal: 'Light salad & soup',
          images: [
            'assets/images/dmeal1.jpg',
            'assets/images/dmeal2.jpg',
            'assets/images/dmeal3.jpg'
          ],
        ),
      ],
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({
    required this.name,
    required this.kcal,
    required this.images,
    super.key,
  });

  final String name;
  final String kcal;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.local_fire_department, size: 14, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(kcal, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          OverlappingFoodAvatars(images: images),
        ],
      ),
    );
  }
}

class OverlappingFoodAvatars extends StatelessWidget {
  const OverlappingFoodAvatars({required this.images, super.key});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: (images.length * 24.0) + 24.0,
      child: Stack(
        children: [
          for (int i = 0; i < images.length; i++)
            Positioned(
              left: i * 20.0,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                  image: DecorationImage(
                    image: AssetImage(images[i]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          Positioned(
            left: images.length * 20.0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: const Icon(Icons.add, size: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}