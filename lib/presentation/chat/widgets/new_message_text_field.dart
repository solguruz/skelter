import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class NewMessageTextField extends StatefulWidget {
  const NewMessageTextField({super.key});

  @override
  State<NewMessageTextField> createState() => _NewMessageTextFieldState();
}

class _NewMessageTextFieldState extends State<NewMessageTextField> {
  final TextEditingController _fullnameController = TextEditingController();

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
          const AppIcon(
            iconData: TablerIcons.plus,
            color: AppColors.neutral400,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: _fullnameController,
              decoration: InputDecoration(
                hintText: context.l10n.send_a_new_message,
                hintStyle: AppTextStyles.p3Medium.withColor(
                  AppColors.textNeutralDisable,
                ),
                errorStyle: AppTextStyles.p3Regular,
                errorMaxLines: 2,
                counterText: '',
                fillColor: AppColors.bgNeutralLight50,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.transparent),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.transparent),
                ),
              ),
              textInputAction: TextInputAction.send,
            ),
          ),
          const SizedBox(width: 8),
          AppIcon(
            iconPath: Assets.icons.send,
            iconData: TablerIcons.message_chatbot,
            color: AppColors.brand500,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    super.dispose();
  }
}
