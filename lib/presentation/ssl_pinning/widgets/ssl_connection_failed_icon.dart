import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/gen/assets.gen.dart';

class SslFailedIcon extends StatelessWidget {
  const SslFailedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.icons.lock,
      height: 80,
      width: 80,
    );
  }
}
