import 'package:flutter/material.dart';
import 'package:swastha_ai/gen/assets.gen.dart';

class WelcomeBG extends StatelessWidget {
  const WelcomeBG({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.white.withValues(alpha: 0.0)],
          stops: const [0.7, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Assets.images.welcomeBg.image(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
