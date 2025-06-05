import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';

class AvailableTimesChips extends StatelessWidget {
  final List<String> times;
  final String? selectedTime;
  final ValueChanged<String> onSelected;

  const AvailableTimesChips({
    super.key,
    required this.times,
    required this.selectedTime,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children:
          times
              .map(
                (time) => ChoiceChip(
                  label: Text(
                    time,
                    style: AppTextTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: selectedTime == time ? Colors.white : Colors.black,
                    ),
                  ),
                  selected: selectedTime == time,
                  onSelected: (_) => onSelected(time),
                  checkmarkColor: Colors.white,
                  selectedColor: AppColors.primary,
                  backgroundColor: const Color(0xFFF1F3F9),
                  labelStyle: const TextStyle(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
              .toList(),
    );
  }
}
