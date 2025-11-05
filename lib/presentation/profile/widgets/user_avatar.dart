import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/profile/bloc/profile_bloc.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    const double profileImageSize = 18.0;
    final bool isProUser = context.select<ProfileBloc, bool>(
      (bloc) => bloc.state.isProUser,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: profileImageSize.w,
          width: profileImageSize.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular((profileImageSize / 2).w),
            child: Assets.images.demoUser.image(
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (isProUser)
          Positioned(
            bottom: -15,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: context.currentTheme.bgBrandLight50,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    TablerIcons.star,
                    color: context.currentTheme.iconBrandHover,
                    size: 16,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    context.localization.pro,
                    style: AppTextStyles.p4SemiBold.copyWith(
                      color: context.currentTheme.iconBrandHover,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
