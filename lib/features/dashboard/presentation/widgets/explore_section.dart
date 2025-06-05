import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _ExploreCard(
            image: 'assets/images/dash_img_2.png',
            title: 'Guided Meditations',
            description:
                'Find peace and relaxation with our curated meditation sessions.',
          ),
          _ExploreCard(
            image: 'assets/images/dash_img_3.png',
            title: 'Mood Tracking',
            description:
                'Monitor your emotional well-being and identify patterns.',
          ),
          _ExploreCard(
            image: 'assets/images/dash_img_4.png',
            title: 'Sleep Stories',
            description: 'Drift into calm sleep with soothing stories.',
          ),
        ],
      ),
    );
  }
}

class _ExploreCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const _ExploreCard({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, height: 70, fit: BoxFit.contain),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(color: Color(0xff4F6194), fontSize: 13),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
