import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/gen/assets.gen.dart';

class SubmissionSuccessIcon extends StatelessWidget {
  const SubmissionSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.icons.mdiTick, height: 80, width: 80);
  }
}
