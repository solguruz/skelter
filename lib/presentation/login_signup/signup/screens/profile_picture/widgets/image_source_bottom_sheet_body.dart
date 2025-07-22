import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceBottomSheetBody extends StatelessWidget {
  const ImageSourceBottomSheetBody({
    super.key,
    required this.onImageSelected,
    this.showRemoveImageButton,
    this.onImageRemoved,
  });

  final void Function(File file) onImageSelected;
  final bool? showRemoveImageButton;
  final void Function()? onImageRemoved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: max(20, MediaQuery.of(context).padding.bottom),
      ),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _Camera(
              onCameraSelected: () async {
                final XFile? xFile = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );
                if (xFile == null) {
                  debugPrint('xFile = null');
                  return;
                }
                Navigator.of(context).pop();
                await _cropImage(context, xFile.path);
              },
            ),
            _Gallery(
              onGallerySelected: () async {
                final XFile? xFile = await pickImageXFile(
                  screenName: ModalRoute.of(context)?.settings.name,
                  source: ImageSource.gallery,
                );
                if (xFile == null) {
                  debugPrint('Photo = null');
                  return;
                }
                Navigator.of(context).pop();
                await _cropImage(context, xFile.path);
              },
            ),
            if (showRemoveImageButton ?? false)
              _RemoveImage(
                onImageRemoved: () {
                  Navigator.of(context).pop();
                  onImageRemoved?.call();
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<XFile?> pickImageXFile({
    String? screenName,
    required ImageSource source,
    CameraDevice? cameraDevice,
  }) async {
    if (cameraDevice != null) {
      return await ImagePicker().pickImage(
        source: source,
        preferredCameraDevice: cameraDevice,
        requestFullMetadata: false,
      );
    }
    return await ImagePicker().pickImage(source: source);
  }

  Future<void> _cropImage(
    BuildContext context,
    String path,
  ) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      uiSettings: [
        AndroidUiSettings(
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [CropAspectRatioPreset.square],
        ),
        IOSUiSettings(
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [CropAspectRatioPreset.square],
        ),
      ],
    );
    if (croppedFile == null) return;
    onImageSelected(File(croppedFile.path));
  }
}

class _RemoveImage extends StatelessWidget {
  const _RemoveImage({
    required this.onImageRemoved,
  });

  final void Function() onImageRemoved;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: AppButton(
                style: AppButtonStyle.outline,
                size: AppButtonSize.extraSmall,
                isIconButton: true,
                iconData: TablerIcons.photo_x,
                onPressed: onImageRemoved,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(context.localization.login_signup_remove),
        ],
      ),
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({
    required this.onGallerySelected,
  });

  final void Function() onGallerySelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: AppButton(
                style: AppButtonStyle.outline,
                size: AppButtonSize.extraSmall,
                isIconButton: true,
                iconData: TablerIcons.photo,
                onPressed: () => onGallerySelected(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(context.localization.login_signup_gallery),
        ],
      ),
    );
  }
}

class _Camera extends StatelessWidget {
  const _Camera({
    required this.onCameraSelected,
  });

  final void Function() onCameraSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: AppButton(
                style: AppButtonStyle.outline,
                size: AppButtonSize.extraSmall,
                isIconButton: true,
                iconData: TablerIcons.camera,
                onPressed: () => onCameraSelected(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(context.localization.login_signup_camera),
        ],
      ),
    );
  }
}
