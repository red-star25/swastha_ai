import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:swastha_ai/features/signup/presentation/widgets/signup_form.dart';
import 'package:swastha_ai/features/signup/presentation/widgets/signup_section.dart';
import 'package:swastha_ai/gen/assets.gen.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, AppColors.secondary],
              stops: [0.5, 1],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.appIconNoBg.image(width: 100, height: 100),
                    const SizedBox(height: 16),
                    Text(
                      "Signup",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const SignupForm(),
                    const SizedBox(height: 24),
                    const SignupSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
