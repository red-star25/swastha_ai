import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';
import 'package:swastha_ai/features/therapist/presentation/pages/feedback_page.dart';

class ConfirmAppointmentPage extends StatelessWidget {
  final String therapistName;
  final String therapistImage;
  final DateTime selectedDate;
  final String selectedTime;

  const ConfirmAppointmentPage({
    super.key,
    required this.therapistName,
    required this.therapistImage,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('EEEE, MMMM d').format(selectedDate);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Confirm your appointment', style: AppTextTheme.h4),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Appointment details',
              style: AppTextTheme.h4.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(therapistImage),
                  backgroundColor: AppColors.primary.withOpacity(0.08),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Therapy Session',
                      style: AppTextTheme.h4.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      therapistName,
                      style: AppTextTheme.bodyMedium.copyWith(
                        color: const Color(0xFF6B7280),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            _DetailRow(
              icon: Icons.calendar_today,
              title: 'Date & Time',
              subtitle: '$formattedDate · $selectedTime',
            ),
            const SizedBox(height: 20),
            _DetailRow(
              icon: Icons.ondemand_video,
              title: 'Location',
              subtitle: 'Online',
            ),
            const SizedBox(height: 20),
            _DetailRow(
              icon: Icons.access_time,
              title: 'Duration',
              subtitle: '60 minutes',
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xF1F3F9FF),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: AppTextTheme.button.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => FeedbackPage(
                                therapistName: 'Dr. Sarah Miller',
                              ),
                        ),
                      );
                    },
                    child: Text(
                      'Confirm',
                      style: AppTextTheme.button.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _DetailRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xF1F3F9FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.black, size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextTheme.h4.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTextTheme.bodyMedium.copyWith(
                color: const Color(0xFF6B7280),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
