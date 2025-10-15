import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:skelter/presentation/contact_us/bloc/contact_us_state.dart';
import 'package:skelter/presentation/contact_us/constant/contact_us_constants.dart';
import 'package:skelter/utils/file_picker_util.dart';
import 'package:skelter/utils/image_picker_util.dart';

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
          error: localizations.email_cant_be_empty,
        ),
      );
    } else if (!kEmailRegex.hasMatch(state.email)) {
      hasError = true;
      add(EmailErrorEvent(error: localizations.invalid_email));
    }

    if (state.description.trim().isEmpty) {
      hasError = true;
      add(DescriptionErrorEvent(error: localizations.message_cannot_be_empty));
    } else if (state.description.trim().length > kMessageMaxLength) {
      hasError = true;
      add(
        DescriptionErrorEvent(
          error: localizations.messageTooLong(kMessageMaxLength),
        ),
      );
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
      final pickedImages = await ImagePickerUtil().pickImages(
        source: event.source,
        maxFileLimit: kMaxFileLimit,
      );

      if (pickedImages.isNotEmpty) {
        emit(
          state.copyWith(
            selectedImages: pickedImages.take(kMaxFileLimit).toList(),
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
      final result = await FilePickerUtil.pickAndValidateFiles(
        localizations: localizations,
        allowedExtensions: kAllowedFileExtensions,
        maxSizeInBytes: kMaxFileSizeInBytes,
        maxFiles: kMaxFileLimit,
        allowMultiple: true,
        isValidFile: isValidPdf,
      );

      if (result.error != null) {
        emit(PickedFilesErrorState(state, error: result.error!));
        return;
      }

      if (result.validFiles.isEmpty) return;

      final updated = [...?state.selectedPdfs, ...result.validFiles];
      emit(ResetPickedFilesErrorState(state));
      emit(
        state.copyWith(
          selectedPdfs: updated.take(kMaxFileLimit).toList(),
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
    return signature == kPdfFileSignature;
  } catch (e) {
    return false;
  }
}
