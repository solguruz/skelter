import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_event.dart';
import 'package:flutter_skeleton/presentation/contact_us/bloc/contact_us_state.dart';
import 'package:image_picker/image_picker.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final AppLocalizations localizations;

  ContactUsBloc({
    required this.localizations,
  }) : super(ContactUsState.initial()) {
    on<NameChangedEvent>(_onNameChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<DescriptionChangedEvent>(_onDescriptionChangedEvent);
    on<SubmitFormEvent>(_onSubmitFormEvent);
    on<AddImageEvent>(_onAddImageEvent);
    on<EmailErrorEvent>(_onEmailErrorEvent);
    on<NameErrorEvent>(_onNameErrorEvent);
    on<DescriptionErrorEvent>(_onDescriptionErrorEvent);
  }
  void _onNameChanged(NameChangedEvent event, Emitter<ContactUsState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onEmailChanged(EmailChangedEvent event, Emitter<ContactUsState> emit) {
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
      add(
        EmailErrorEvent(
          error: localizations.login_signup_invalid_email,
        ),
      );
    }

    if (state.description.trim().isEmpty) {
      hasError = true;
      add(
        DescriptionErrorEvent(
          error: localizations.message_cannot_be_empty,
        ),
      );
    }

    if (state.selectedImages?.isEmpty ?? true) {
      hasError = true;
      emit(
        PickedFilesErrorState(
          state,
          error: localizations.image_cannot_be_empty,
        ),
      );
    }

    if (!hasError) {
      emit(ContactUsSubmittedState(state));
    }
  }

  Future<void> _onAddImageEvent(
    AddImageEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    try {
      final picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage(limit: 5);

      if (images.isNotEmpty) {
        emit(state.copyWith(selectedImages: images.take(5).toList()));
        emit(ResetPickedFilesErrorState(state));
      }
    } catch (e) {
      debugPrint('Image picking error: $e');
      emit(
        state.copyWith(
          errorMessage: localizations.pick_image_error,
        ),
      );
    }
  }

  void _onEmailErrorEvent(EmailErrorEvent event, Emitter<ContactUsState> emit) {
    emit(
      state.copyWith(emailError: event.error),
    );
  }

  void _onNameErrorEvent(NameErrorEvent event, Emitter<ContactUsState> emit) {
    emit(
      state.copyWith(nameError: event.error),
    );
  }

  void _onDescriptionErrorEvent(
    DescriptionErrorEvent event,
    Emitter<ContactUsState> emit,
  ) {
    emit(
      state.copyWith(descriptionError: event.error),
    );
  }
}

extension ContactUsBlocExtension on BuildContext {
  ContactUsBloc get contactUsBloc => BlocProvider.of<ContactUsBloc>(this);
}
