import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_show_file_section.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/contact_us_upload_file_section.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ContactUsAttachmentSection extends StatelessWidget {
  const ContactUsAttachmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final images = context.select<ContactUsBloc, List<XFile>>(
      (bloc) => bloc.state.selectedImages ?? [],
    );

    final pickedImagesError = context.select<ContactUsBloc, String>(
      (bloc) => bloc.state.pickedFilesErrorMessage ?? '',
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.attachment,
            style: AppTextStyles.p3Medium,
          ),
          const SizedBox(height: 6),
          if (images.isEmpty)
            contactUsUploadFiles(context)
          else
            contactUsShowFiles(images),
          if (pickedImagesError.isNotEmpty)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    pickedImagesError,
                    style: AppTextStyles.p4Regular
                        .withColor(AppColors.textErrorSecondary),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
