import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

class UploadAttachment extends StatelessWidget {
  const UploadAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    final hasAttachments = context.select<ContactUsBloc, bool>(
      (bloc) =>
          (bloc.state.selectedImages?.isNotEmpty ?? false) ||
          (bloc.state.selectedPdfs?.isNotEmpty ?? false),
    );

    return hasAttachments
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () => _showImageSourceBottomSheet(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                color: context.currentTheme.bgSurfaceBase2,
                borderRadius: BorderRadius.circular(12),
                border: DashedBorder.fromBorderSide(
                  dashLength: 6,
                  side: BorderSide(
                    color: context.currentTheme.strokeNeutralDisabled,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    TablerIcons.file_upload,
                    color: context.currentTheme.strokeNeutralHover,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.localization.choose_a_file,
                    style: AppTextStyles.p3Medium.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.localization.supported_format,
                    style: AppTextStyles.p4Regular.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

void _showImageSourceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: context.currentTheme.bgSurfaceBase2,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 22),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => context.router.maybePop(),
                  child: Icon(
                    TablerIcons.x,
                    color: context.currentTheme.iconNeutralHover,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              AppButton(
                label: context.localization.take_a_photo,
                foregroundColor: context.currentTheme.textNeutralPrimary,
                backgroundColor: context.currentTheme.bgSurfaceBase2,
                shouldSetFullWidth: true,
                style: AppButtonStyle.outline,
                leftIcon: TablerIcons.camera,
                size: AppButtonSize.extraLarge,
                onPressed: () {
                  context.router.maybePop();
                  context.read<ContactUsBloc>().add(
                        const AddImageEvent(source: ImageSource.camera),
                      );
                },
              ),
              const SizedBox(height: 16.0),
              AppButton(
                label: context.localization.upload_from_gallery,
                foregroundColor: context.currentTheme.textNeutralPrimary,
                backgroundColor: context.currentTheme.bgSurfaceBase2,
                shouldSetFullWidth: true,
                style: AppButtonStyle.outline,
                leftIcon: TablerIcons.photo,
                size: AppButtonSize.extraLarge,
                onPressed: () {
                  context.router.maybePop();
                  context.read<ContactUsBloc>().add(
                        const AddImageEvent(source: ImageSource.gallery),
                      );
                },
              ),
              const SizedBox(height: 16.0),
              AppButton(
                label: context.localization.upload_from_files,
                foregroundColor: context.currentTheme.textNeutralPrimary,
                backgroundColor: context.currentTheme.bgSurfaceBase2,
                shouldSetFullWidth: true,
                style: AppButtonStyle.outline,
                leftIcon: TablerIcons.folders,
                size: AppButtonSize.extraLarge,
                onPressed: () {
                  context.router.maybePop();
                  context.read<ContactUsBloc>().add(const AddPdfEvent());
                },
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      );
    },
  );
}
