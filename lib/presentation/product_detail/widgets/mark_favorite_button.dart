import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class MarkFavoriteButton extends StatelessWidget {
  const MarkFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppButton(
        label: context.localization.mark_favorite,
        size: AppButtonSize.extraLarge,
        leftIcon: TablerIcons.heart,
        isLeftIconAttachedToText: true,
        paddingOverride: EdgeInsets.zero,
        onPressed: () {
          context.showSnackBar('Item added to favorite');
        },
      ),
    );
  }
}
