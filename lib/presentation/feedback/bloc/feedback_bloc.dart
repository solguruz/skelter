import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_event.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_state.dart';
import 'package:skelter/presentation/feedback/constants/feedback_constants.dart';
import 'package:skelter/presentation/feedback/domain/usecases/submit_feedback.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc({required this.submitFeedback, required this.localizations})
    : super(const FeedbackState.initial()) {
    on<FeedbackRatingChangedEvent>(_onFeedbackRatingChangedEvent);
    on<FeedbackRatingErrorEvent>(_onFeedbackRatingErrorEvent);
    on<FeedbackCategoryChangedEvent>(_onFeedbackCategoryChangedEvent);
    on<FeedbackCategoryErrorEvent>(_onFeedbackCategoryErrorEvent);
    on<FeedbackMessageChangedEvent>(_onFeedbackMessageChangedEvent);
    on<FeedbackMessageErrorEvent>(_onFeedbackMessageErrorEvent);
    on<FeedbackSubmittedEvent>(_onFeedbackSubmittedEvent);
  }

  final SubmitFeedback submitFeedback;
  final AppLocalizations localizations;

  void _onFeedbackRatingChangedEvent(
    FeedbackRatingChangedEvent event,
    Emitter<FeedbackState> emit,
  ) {
    final previousError = state.ratingError;
    if (previousError != null && previousError.isNotEmpty) {
      emit(state.copyWith(ratingError: ''));
    }
    emit(state.copyWith(rating: event.rating));
  }

  void _onFeedbackRatingErrorEvent(
    FeedbackRatingErrorEvent event,
    Emitter<FeedbackState> emit,
  ) {
    emit(state.copyWith(ratingError: event.error));
  }

  void _onFeedbackCategoryChangedEvent(
    FeedbackCategoryChangedEvent event,
    Emitter<FeedbackState> emit,
  ) {
    final previousError = state.categoryError;
    if (previousError != null && previousError.isNotEmpty) {
      emit(state.copyWith(categoryError: ''));
    }
    emit(state.copyWith(category: event.category));
  }

  void _onFeedbackCategoryErrorEvent(
    FeedbackCategoryErrorEvent event,
    Emitter<FeedbackState> emit,
  ) {
    emit(state.copyWith(categoryError: event.error));
  }

  void _onFeedbackMessageChangedEvent(
    FeedbackMessageChangedEvent event,
    Emitter<FeedbackState> emit,
  ) {
    final previousError = state.messageError;
    if (previousError != null && previousError.isNotEmpty) {
      add(const FeedbackMessageErrorEvent(error: ''));
    }
    emit(state.copyWith(message: event.message));
  }

  void _onFeedbackMessageErrorEvent(
    FeedbackMessageErrorEvent event,
    Emitter<FeedbackState> emit,
  ) {
    emit(state.copyWith(messageError: event.error));
  }

  Future<void> _onFeedbackSubmittedEvent(
    FeedbackSubmittedEvent event,
    Emitter<FeedbackState> emit,
  ) async {
    bool hasError = false;

    if (state.rating == 0) {
      hasError = true;
      add(
        FeedbackRatingErrorEvent(error: localizations.please_select_a_rating),
      );
    }

    if (state.category == null) {
      hasError = true;
      add(
        FeedbackCategoryErrorEvent(
          error: localizations.feedback_category_required,
        ),
      );
    }

    if (state.message.trim().isEmpty) {
      hasError = true;
      add(
        FeedbackMessageErrorEvent(
          error: localizations.please_share_your_thoughts,
        ),
      );
    } else if (state.message.trim().length > kFeedbackMessageMaxLength) {
      hasError = true;
      add(
        FeedbackMessageErrorEvent(
          error: localizations.messageTooLong(kFeedbackMessageMaxLength),
        ),
      );
    }

    if (hasError) return;

    emit(state.copyWith(isLoading: true));

    final result = await submitFeedback(
      SubmitFeedbackParams(
        userId: event.userId,
        name: event.name,
        email: event.email,
        phoneNumber: event.phoneNumber,
        rating: state.rating,
        category: state.category!,
        message: state.message.trim(),
      ),
    );

    result.fold(
      (failure) {
        debugPrint('[FeedbackBloc] submission failed: ${failure.errorMessage}');
        emit(
          FeedbackSubmittedFailureState(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
        );
      },
      (_) {
        emit(FeedbackSubmittedSuccessState(state.copyWith(isLoading: false)));
      },
    );
  }
}
