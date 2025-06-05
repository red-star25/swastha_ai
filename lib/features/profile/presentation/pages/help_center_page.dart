import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Help Center', style: AppTextTheme.h4),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Text(
            'Frequently Asked Questions',
            style: AppTextTheme.h4.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          _FaqItem(
            question: 'How do I book a session?',
            answer:
                'Go to the Therapist section, select a therapist, and tap Book Appointment.',
          ),
          _FaqItem(
            question: 'How do I reset my password?',
            answer:
                'Go to Profile > Edit Profile and follow the instructions to reset your password.',
          ),
          _FaqItem(
            question: 'How do I contact support?',
            answer:
                'Use the button below or email us at support@swasthaai.com.',
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            icon: const Icon(Icons.email_outlined, color: Colors.white),
            label: Text(
              'Contact Support',
              style: AppTextTheme.button.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              // TODO: Implement contact support (e.g., open email)
            },
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  const _FaqItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: AppTextTheme.h4.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            answer,
            style: AppTextTheme.bodyMedium.copyWith(
              color: AppColors.darkGrey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
