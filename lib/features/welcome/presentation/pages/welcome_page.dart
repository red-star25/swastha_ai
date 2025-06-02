import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:swastha_ai/common_widgets/button_widget.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';
import 'package:swastha_ai/features/welcome/presentation/widgets/welcome_bg.dart';
import 'package:swastha_ai/features/welcome/presentation/widgets/welcome_text.dart';
import 'package:swastha_ai/routes/paths.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WelcomeBG(),
          const Gap(10),
          Text("Welcome to SwasthaAI", style: AppTextTheme.h2),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Your journey to a calmer, more balanced you starts here. Let's begin this path together.",
              style: AppTextTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          WelcomeText(pulseAnimation: _pulseAnimation),
          const Spacer(),
          SafeArea(
            child: ButtonWidget(
              text: "Continue",
              onPressed: () {
                context.push(Paths.login);
              },
              width: MediaQuery.of(context).size.width,
              backgroundColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
