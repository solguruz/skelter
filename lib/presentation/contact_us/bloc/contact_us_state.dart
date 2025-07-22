import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactUsState with EquatableMixin {
  final String name;
  final String email;
  final String description;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isNameFocused;
  final bool isEmailFocused;
  final bool isMessageFocused;
  final String? nameError;
  final String? emailError;
  final String? descriptionError;
  final List<XFile>? selectedImages;
  final String? pickedFilesErrorMessage;
  final List<File>? selectedPdfs;

  ContactUsState({
    required this.name,
    required this.email,
    required this.description,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isNameFocused,
    required this.isEmailFocused,
    required this.isMessageFocused,
    this.nameError,
    this.emailError,
    this.descriptionError,
    this.selectedImages,
    this.pickedFilesErrorMessage,
    this.selectedPdfs,
  });

  ContactUsState.initial()
      : name = '',
        email = '',
        description = '',
        isSubmitting = false,
        isSuccess = false,
        isNameFocused = false,
        isEmailFocused = false,
        isMessageFocused = false,
        nameError = null,
        emailError = null,
        descriptionError = null,
        selectedImages = null,
        pickedFilesErrorMessage = null,
        selectedPdfs = null;

  ContactUsState.copy(ContactUsState state)
      : name = state.name,
        email = state.email,
        description = state.description,
        isSubmitting = state.isSubmitting,
        isSuccess = state.isSuccess,
        isNameFocused = state.isNameFocused,
        isEmailFocused = state.isEmailFocused,
        isMessageFocused = state.isMessageFocused,
        nameError = state.nameError,
        emailError = state.emailError,
        descriptionError = state.descriptionError,
        selectedImages = state.selectedImages,
        pickedFilesErrorMessage = state.pickedFilesErrorMessage,
        selectedPdfs = state.selectedPdfs;

  ContactUsState copyWith({
    String? name,
    String? email,
    String? description,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isNameFocused,
    bool? isEmailFocused,
    bool? isMessageFocused,
    String? nameError,
    String? emailError,
    String? descriptionError,
    List<XFile>? selectedImages,
    String? errorMessage,
    String? pickedFilesErrorMessage,
    bool resetPickedFilesError = false,
    List<File>? selectedPdfs,
  }) {
    return ContactUsState(
      name: name ?? this.name,
      email: email ?? this.email,
      description: description ?? this.description,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isNameFocused: isNameFocused ?? this.isNameFocused,
      isEmailFocused: isEmailFocused ?? this.isEmailFocused,
      isMessageFocused: isMessageFocused ?? this.isMessageFocused,
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      descriptionError: descriptionError ?? this.descriptionError,
      selectedImages: selectedImages ?? this.selectedImages,
      pickedFilesErrorMessage: pickedFilesErrorMessage ??
          (resetPickedFilesError ? null : this.pickedFilesErrorMessage),
      selectedPdfs: selectedPdfs ?? this.selectedPdfs,
    );
  }

  @visibleForTesting
  ContactUsState.test({
    String? name,
    String? email,
    String? description,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isNameFocused,
    bool? isEmailFocused,
    bool? isMessageFocused,
    String? nameError,
    String? emailError,
    String? descriptionError,
    List<XFile>? selectedImages,
    String? pickedFilesErrorMessage,
    List<File>? selectedPdfs,
  })  : name = name ?? '',
        email = email ?? '',
        description = description ?? '',
        isSubmitting = isSubmitting ?? false,
        isSuccess = isSuccess ?? false,
        isNameFocused = isNameFocused ?? false,
        isEmailFocused = isEmailFocused ?? false,
        isMessageFocused = isMessageFocused ?? false,
        nameError = nameError ?? '',
        emailError = emailError ?? '',
        descriptionError = descriptionError ?? '',
        selectedImages = selectedImages ?? [],
        pickedFilesErrorMessage = pickedFilesErrorMessage ?? '',
        selectedPdfs = selectedPdfs ?? [];

  @override
  List<Object?> get props => [
        name,
        email,
        description,
        isSubmitting,
        isSuccess,
        isNameFocused,
        isEmailFocused,
        isMessageFocused,
        nameError,
        emailError,
        descriptionError,
        selectedImages,
        pickedFilesErrorMessage,
        selectedPdfs,
      ];
}

class ContactUsSubmittedState extends ContactUsState {
  ContactUsSubmittedState(super.state) : super.copy();
}

class PickedFilesErrorState extends ContactUsState {
  PickedFilesErrorState(ContactUsState state, {required String error})
      : super.copy(state.copyWith(pickedFilesErrorMessage: error));
}

class ResetPickedFilesErrorState extends ContactUsState {
  ResetPickedFilesErrorState(ContactUsState state)
      : super.copy(state.copyWith(resetPickedFilesError: true));
}
