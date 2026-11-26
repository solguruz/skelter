import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:material_ui/material_ui.dart';

class ContactUsShowFiles extends StatelessWidget {
  const ContactUsShowFiles({required this.images, super.key});

  final List<XFile> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: images.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final image = images[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(image.path),
              height: 80,
              width: 80,
              fit: .cover,
            ),
          );
        },
      ),
    );
  }
}
