import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_state.dart';
import 'package:flutter_skeleton/presentation/contact_us/contact_us_screen.dart';
import 'package:image_picker/image_picker.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final AppLocalizations localizations;

  ContactUsBloc({
    required this.localizations,
  }) : super(ContactUsState.initial()) {
    on<NameChangedEvent>(_onNameChangedEvent);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<DescriptionChangedEvent>(_onDescriptionChangedEvent);
    on<SubmitFormEvent>(_onSubmitFormEvent);
    on<AddImageEvent>(_onAddImageEvent);
    on<EmailErrorEvent>(_onEmailErrorEvent);
    on<NameErrorEvent>(_onNameErrorEvent);
    on<DescriptionErrorEvent>(_onDescriptionErrorEvent);
    on<AddPdfEvent>(_onAddPdfEvent);
    on<RemoveImageEvent>(_onRemoveImageEvent);
    on<RemovePdfEvent>(_onRemovePdfEvent);
  }

  void _onNameChangedEvent(
    NameChangedEvent event,
    Emitter<ContactUsState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  void _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<ContactUsState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onDescriptionChangedEvent(
    DescriptionChangedEvent event,
    Emitter<ContactUsState> emit,
  ) {
    emit(state.copyWith(description: event.message));
  }

  void _onSubmitFormEvent(SubmitFormEvent event, Emitter<ContactUsState> emit) {
    bool hasError = false;

    if (state.name.trim().isEmpty) {
      hasError = true;
      add(NameErrorEvent(error: localizations.name_cannot_be_empty));
    }

    if (state.email.trim().isEmpty) {
      hasError = true;
      add(
        EmailErrorEvent(
          error: localizations.login_signup_email_cant_be_empty,
        ),
      );
    } else if (!kEmailRegex.hasMatch(state.email)) {
      hasError = true;
      add(EmailErrorEvent(error: localizations.login_signup_invalid_email));
    }

    if (state.description.trim().isEmpty) {
      hasError = true;
      add(DescriptionErrorEvent(error: localizations.message_cannot_be_empty));
    }

    final areFilesMissing = (state.selectedPdfs?.isEmpty ?? true) &&
        (state.selectedImages?.isEmpty ?? true);
    if (areFilesMissing) {
      hasError = true;
      emit(
        PickedFilesErrorState(
          state,
          error: localizations.file_cannot_be_empty,
        ),
      );
    }

    if (!hasError) {
      emit(ContactUsSubmittedState(state));
    }
  }

  void _onEmailErrorEvent(EmailErrorEvent event, Emitter<ContactUsState> emit) {
    emit(state.copyWith(emailError: event.error));
  }

  void _onNameErrorEvent(NameErrorEvent event, Emitter<ContactUsState> emit) {
    emit(state.copyWith(nameError: event.error));
  }

  void _onDescriptionErrorEvent(
    DescriptionErrorEvent event,
    Emitter<ContactUsState> emit,
  ) {
    emit(state.copyWith(descriptionError: event.error));
  }

  Future<void> _onAddImageEvent(
    AddImageEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    try {
      final picker = ImagePicker();
      List<XFile> pickedImages = [];

      if (event.source == ImageSource.gallery) {
        pickedImages =
            await picker.pickMultiImage(limit: ContactUsScreen.kMaxFileLimit);
      } else {
        final XFile? image = await picker.pickImage(source: ImageSource.camera);
        if (image != null) pickedImages = [image];
      }

      if (pickedImages.isNotEmpty) {
        emit(
          state.copyWith(
            selectedImages:
                pickedImages.take(ContactUsScreen.kMaxFileLimit).toList(),
          ),
        );
        emit(ResetPickedFilesErrorState(state));
      }
    } catch (e) {
      debugPrint('Image picking error: $e');
      emit(PickedFilesErrorState(state, error: localizations.pick_image_error));
    }
  }

  void _onRemoveImageEvent(
    RemoveImageEvent event,
    Emitter<ContactUsState> emit,
  ) {
    final images = List<XFile>.from(state.selectedImages ?? []);
    images.removeAt(event.index);
    emit(state.copyWith(selectedImages: images));
  }

  Future<void> _onAddPdfEvent(
    AddPdfEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: kAllowedFileExtensions,
        allowMultiple: true,
      );

      if (result == null) return;

      final files = <File>[];

      for (final path in result.paths) {
        if (path != null) {
          final file = File(path);
          final fileSize = await file.length();

          if (fileSize == 0) {
            emit(
              PickedFilesErrorState(
                state,
                error: localizations.file_empty_error,
              ),
            );
            return;
          }

          if (fileSize > ContactUsScreen.kMaxFileSizeInBytes) {
            emit(
              PickedFilesErrorState(
                state,
                error: localizations.file_too_large_error,
              ),
            );
            return;
          }

          if (!await isValidPdf(file)) {
            emit(
              PickedFilesErrorState(
                state,
                error: localizations.unsupported_file_format_error,
              ),
            );
            return;
          }

          files.add(file);
        }
      }

      final updated = [...?state.selectedPdfs, ...files];
      emit(ResetPickedFilesErrorState(state));
      emit(
        state.copyWith(
          selectedPdfs: updated.take(ContactUsScreen.kMaxFileLimit).toList(),
        ),
      );
    } catch (e) {
      debugPrint('Pdf picking error: $e');
      emit(PickedFilesErrorState(state, error: localizations.pick_pdf_error));
    }
  }

  void _onRemovePdfEvent(RemovePdfEvent event, Emitter<ContactUsState> emit) {
    final updatedPdf = List<File>.from(state.selectedPdfs ?? []);
    updatedPdf.removeAt(event.index);
    emit(state.copyWith(selectedPdfs: updatedPdf));
  }
}

Future<bool> isValidPdf(File file) async {
  try {
    final bytes = await file.openRead(0, 5).first;
    final signature = String.fromCharCodes(bytes);
    return signature == ContactUsScreen.kPdfFileSignature;
  } catch (e) {
    return false;
  }
}
