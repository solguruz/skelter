import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class NewMessageTextField extends StatefulWidget {
  const NewMessageTextField({super.key});

  @override
  State<NewMessageTextField> createState() => _NewMessageTextFieldState();
}

class _NewMessageTextFieldState extends State<NewMessageTextField> {
  final TextEditingController _fullNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Icon(
            TablerIcons.plus,
            color: context.currentTheme.iconNeutralPressed,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: _fullNameController,
              style: AppTextStyles.p3Medium
                  .copyWith(color: context.currentTheme.textNeutralPrimary),
              decoration: InputDecoration(
                hintText: context.localization.send_a_new_message,
                hintStyle: AppTextStyles.p3Medium.copyWith(
                  color: context.currentTheme.textNeutralDisable,
                ),
                errorStyle: AppTextStyles.p3Regular,
                errorMaxLines: 2,
                counterText: '',
                fillColor: context.currentTheme.bgNeutralLight50,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: context.currentTheme.textNeutralLight,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: context.currentTheme.textNeutralLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: context.currentTheme.textNeutralLight),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: context.currentTheme.textErrorLight),
                ),
              ),
              textInputAction: TextInputAction.send,
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            Assets.icons.send,
            colorFilter: ColorFilter.mode(
              context.currentTheme.bgBrandHover,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }
}
