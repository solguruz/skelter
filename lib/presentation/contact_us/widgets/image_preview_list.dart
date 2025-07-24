import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_bloc.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/presentation/contact_us/widgets/remove_file_button.dart';
import 'package:flutter_skeleton/utils/app_environment.dart';
import 'package:image_picker/image_picker.dart';

class ImagePreviewList extends StatelessWidget {
  const ImagePreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    final images = context.select<ContactUsBloc, List<XFile>>(
      (bloc) => bloc.state.selectedImages ?? [],
    );

    return images.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, index) {
                final image = images[index];
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AppEnvironment.isTestEnvironment
                          ? Image.asset(
                              image.path,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(image.path),
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                    ),
                    RemoveFileButton(
                      onRemove: (index) => context
                          .read<ContactUsBloc>()
                          .add(RemoveImageEvent(index)),
                      index: index,
                    ),
                  ],
                );
              },
            ),
          );
  }
}
