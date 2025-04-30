import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubmissionSuccessIcon extends StatelessWidget {
  const SubmissionSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.icons.mdiTick, height: 80, width: 80);
  }
}
