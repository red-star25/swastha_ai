import 'package:flutter/material.dart';

class VerifyHeader extends StatelessWidget {
  const VerifyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Check your inbox',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'We\'ve sent a verification code to your email address. Please enter it below to continue.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
