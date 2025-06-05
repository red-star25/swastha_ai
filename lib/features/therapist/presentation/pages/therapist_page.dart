import 'package:flutter/material.dart';
import 'package:swastha_ai/common_widgets/app_bottom_nav_bar.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';
import 'package:swastha_ai/features/therapist/presentation/pages/therapist_details_page.dart';
import 'package:swastha_ai/gen/assets.gen.dart';

class TherapistPage extends StatefulWidget {
  const TherapistPage({super.key});

  @override
  State<TherapistPage> createState() => _TherapistPageState();
}

class _TherapistPageState extends State<TherapistPage> {
  final List<Map<String, dynamic>> therapists = [
    {
      'name': 'Dr. Sarah Miller',
      'subtitle': 'Specializes in anxiety and depression',
      'image': Assets.images.dashImg1.path,
      'title': 'Licensed Clinical Psychologist',
      'experience': '5 years of experience',
      'about':
          "Dr. Sharma is a licensed clinical psychologist with over 5 years of experience in helping individuals navigate life's challenges. She specializes in cognitive behavioral therapy (CBT) and mindfulness-based approaches.",
      'specializations': ['Anxiety', 'Depression', 'Stress Management'],
    },
    {
      'name': 'Dr. Michael Chen',
      'subtitle': 'Focuses on relationship and family therapy',
      'image': Assets.images.dashImg2.path,
      'title': 'Relationship & Family Therapist',
      'experience': '8 years of experience',
      'about':
          "Dr. Chen specializes in relationship and family therapy, helping couples and families build stronger connections and resolve conflicts.",
      'specializations': ['Relationship', 'Family Therapy'],
    },
    {
      'name': 'Dr. Emily Davis',
      'subtitle': 'Expert in trauma and PTSD',
      'image': Assets.images.dashImg3.path,
      'title': 'Trauma Specialist',
      'experience': '6 years of experience',
      'about':
          "Dr. Davis is an expert in trauma and PTSD, providing compassionate care for those recovering from traumatic experiences.",
      'specializations': ['Trauma', 'PTSD'],
    },
    {
      'name': 'Dr. David Lee',
      'subtitle': 'Offers therapy for stress management',
      'image': Assets.images.dashImg1.path,
      'title': 'Stress Management Expert',
      'experience': '4 years of experience',
      'about':
          "Dr. Lee offers therapy for stress management, helping clients develop effective coping strategies.",
      'specializations': ['Stress Management'],
    },
  ];

  final List<String> filters = ['Specialty', 'Insurance', 'Availability'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Therapists', style: AppTextTheme.h4),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Search Bar
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE8EBF2),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFF4F6194)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search for a therapist',
                        hintStyle: AppTextTheme.bodyMedium.copyWith(
                          color: const Color(0xFF4F6194),
                          fontWeight: FontWeight.w400,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: AppTextTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(filters.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: FilterChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            filters[index],
                            style: AppTextTheme.bodyMedium.copyWith(
                              color: AppColors.darkGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: Color(0xFF8B94A3),
                          ),
                        ],
                      ),
                      onSelected: (_) {},
                      backgroundColor: const Color(0xFFE8EBF2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      showCheckmark: false,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),
            // Therapist List
            Expanded(
              child: ListView.separated(
                itemCount: therapists.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final therapist = therapists[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => TherapistDetailsPage(
                                name: therapist['name'],
                                title: therapist['title'],
                                experience: therapist['experience'],
                                about: therapist['about'],
                                image: therapist['image'],
                                specializations: List<String>.from(
                                  therapist['specializations'],
                                ),
                              ),
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage(therapist['image']),
                          backgroundColor: AppColors.primary.withValues(
                            alpha: 0.1,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                therapist['name'],
                                style: AppTextTheme.h4.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                therapist['subtitle'],
                                style: AppTextTheme.bodyMedium.copyWith(
                                  color: const Color(0xFF6B7280),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(selectedIndex: 2),
    );
  }
}
