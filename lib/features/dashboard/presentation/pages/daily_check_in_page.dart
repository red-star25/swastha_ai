import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';

class DailyCheckInPage extends StatefulWidget {
  const DailyCheckInPage({super.key});

  @override
  State<DailyCheckInPage> createState() => _DailyCheckInPageState();
}

class _DailyCheckInPageState extends State<DailyCheckInPage> {
  final List<_Mood> moods = [
    _Mood('Great', '😄', AppColors.primary),
    _Mood('Good', '🙂', const Color(0xFF7ED957)),
    _Mood('Okay', '😐', const Color(0xFFFFD966)),
    _Mood('Bad', '😔', const Color(0xFFFFA500)),
    _Mood('Awful', '😢', const Color(0xFFFF5C5C)),
  ];
  int? selectedMoodIndex;
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Daily Check-In', style: AppTextTheme.h4),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Text(
                'How are you feeling today?',
                style: AppTextTheme.h4.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Logging your mood daily helps you track your well-being and reflect on your journey.',
                style: AppTextTheme.bodyMedium.copyWith(
                  fontSize: 16,
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Mood selection grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: moods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final mood = moods[index];
                  final isSelected = selectedMoodIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMoodIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? mood.color.withOpacity(0.15)
                                : const Color(0xFFF5F6FA),
                        borderRadius: BorderRadius.circular(18),
                        border:
                            isSelected
                                ? Border.all(color: mood.color, width: 2)
                                : null,
                        boxShadow:
                            isSelected
                                ? [
                                  BoxShadow(
                                    color: mood.color.withOpacity(0.18),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                                : [],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mood.emoji,
                            style: const TextStyle(fontSize: 38),
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Text(
                              mood.label,
                              style: AppTextTheme.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color:
                                    isSelected
                                        ? mood.color
                                        : AppColors.darkGrey,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 36),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Add a note (optional)',
                  style: AppTextTheme.h4.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFD6DBF5)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: _noteController,
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Write about your day... (optional)',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              // Add extra space at the bottom so the note field is not hidden by the button
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  selectedMoodIndex != null
                      ? AppColors.primary
                      : AppColors.primary.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
            ),
            onPressed:
                selectedMoodIndex != null
                    ? () {
                      // Handle submission
                      final mood = moods[selectedMoodIndex!].label;
                      final note = _noteController.text;
                      // You can show a snackbar or navigate
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Mood "$mood" logged!')),
                      );
                    }
                    : null,
            child: Text(
              'Submit',
              style: AppTextTheme.button.copyWith(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _Mood {
  final String label;
  final String emoji;
  final Color color;
  const _Mood(this.label, this.emoji, this.color);
}
