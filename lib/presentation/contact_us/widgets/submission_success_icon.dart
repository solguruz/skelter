import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skelter/gen/assets.gen.dart';

class SubmissionSuccessIcon extends StatelessWidget {
  const SubmissionSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Lottie.asset(
        Assets.animations.successCheckmarkBlueBg,
        width: 80,
        height: 80,
        repeat: false,
      ),
    );
  }
}
