import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swastha_ai/features/welcome/presentation/widgets/wellness_icon.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key, required Animation<double> pulseAnimation})
    : _pulseAnimation = pulseAnimation;

  final Animation<double> _pulseAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _pulseAnimation.value,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.1),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + (1.0 - _pulseAnimation.value) * 0.5,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.15),
                    ),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WellnessIcon(icon: Icons.self_improvement, label: "Meditate"),
                Gap(20),
                WellnessIcon(icon: Icons.favorite, label: "Health"),
                Gap(20),
                WellnessIcon(icon: Icons.psychology, label: "Mind"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
