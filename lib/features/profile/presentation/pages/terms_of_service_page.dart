import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

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
        title: Text('Terms of Service', style: AppTextTheme.h4),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Service',
                style: AppTextTheme.h4.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'This is a placeholder for the Terms of Service.\n\n'
                '1. Introduction\n'
                '2. User Responsibilities\n'
                '3. Privacy Policy\n'
                '4. Limitation of Liability\n'
                '5. Changes to Terms\n\n'
                'Please read these terms carefully before using the app. By using SwasthaAI, you agree to these terms. For more information, contact support@swasthaai.com.',
                style: AppTextTheme.bodyMedium.copyWith(
                  fontSize: 15,
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
