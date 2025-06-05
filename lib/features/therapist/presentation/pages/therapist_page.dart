import 'package:flutter/material.dart';
import 'package:swastha_ai/common_widgets/app_bottom_nav_bar.dart';
import 'package:swastha_ai/common_widgets/button_widget.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';
import 'package:swastha_ai/gen/assets.gen.dart';

class TherapistPage extends StatefulWidget {
  const TherapistPage({super.key});

  @override
  State<TherapistPage> createState() => _TherapistPageState();
}

class _TherapistPageState extends State<TherapistPage> {
  int selectedFilter = 0;
  final List<String> filters = ['All', 'Available Today', 'Specialization'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Find a Therapist', style: AppTextTheme.h4),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(filters.length, (index) {
                  final isSelected = selectedFilter == index;
                  return Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: ChoiceChip(
                      checkmarkColor: AppColors.white,
                      label: Text(
                        filters[index],
                        style: AppTextTheme.bodyMedium.copyWith(
                          color: isSelected ? Colors.white : AppColors.darkGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() {
                          selectedFilter = index;
                        });
                      },
                      selectedColor: AppColors.primary,
                      backgroundColor: const Color(0xFFF5F6FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  TherapistCard(
                    name: 'Dr. Anya Sharma',
                    image: Assets.images.dashImg1.path,
                  ),
                  const SizedBox(height: 16),
                  TherapistCard(
                    name: 'Dr. Ben Carter',
                    image: Assets.images.dashImg2.path,
                  ),
                  const SizedBox(height: 16),
                  TherapistCard(
                    name: 'Dr. Chloe Davis',
                    image: Assets.images.dashImg3.path,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(selectedIndex: 2),
    );
  }
}

class TherapistCard extends StatelessWidget {
  final String name;
  final String image;

  const TherapistCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextTheme.h4.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Specializes in anxiety and depression",
                style: AppTextTheme.bodyMedium.copyWith(
                  color: AppColors.darkGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 120,
                child: ButtonWidget(
                  text: 'View Profile',
                  height: 40,
                  borderRadius: 12,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  textStyle: AppTextTheme.button.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 114,
              width: 130,
              color: Colors.grey.withValues(alpha: 0.1),
              child: Image.asset(
                image,
                width: 110,
                height: 110,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
