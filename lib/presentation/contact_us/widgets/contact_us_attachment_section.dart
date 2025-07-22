import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/attachment_error_display.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/image_preview_list.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/pdf_preview_list.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/upload_attachment.dart';

class ContactUsAttachmentSection extends StatelessWidget {
  const ContactUsAttachmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.localization.attachment, style: AppTextStyles.p3Medium),
        const SizedBox(height: 6),
        const UploadAttachment(),
        const ImagePreviewList(),
        const SizedBox(height: 8),
        const PdfPreviewList(),
        const AttachmentErrorDisplay(),
      ],
    );
  }
}
