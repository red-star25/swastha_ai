import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/gen/assets.gen.dart';

class DailyCheckInCard extends StatelessWidget {
  const DailyCheckInCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Check–in',
                  style: TextStyle(color: Color(0xff4F6194), fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  'How are you feeling today?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  'Take a quick assessment to track your mood and get personalized recommendations.',
                  style: TextStyle(fontSize: 14, color: Color(0xff4F6194)),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Start',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primary.withValues(alpha: 0.1),
              ),
              child: Assets.images.dashImg1.image(
                fit: BoxFit.contain,
                width: 90,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
