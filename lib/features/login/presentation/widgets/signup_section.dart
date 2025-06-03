import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/routes/paths.dart';

class SignupSection extends StatelessWidget {
  const SignupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            color: AppColors.white.withValues(alpha: 0.8),
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () => context.push(Paths.signup),
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
