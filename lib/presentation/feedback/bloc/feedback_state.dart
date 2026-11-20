import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skelter/presentation/feedback/enum/feedback_category.dart';

class FeedbackState with Equatable {
  const FeedbackState({
    required this.rating,
    required this.message,
    required this.isLoading,
    this.category,
    this.errorMessage,
    this.categoryError,
    this.messageError,
    this.ratingError,
  });

  const FeedbackState.initial()
    : rating = 0,
      message = '',
      isLoading = false,
      category = null,
      errorMessage = null,
      categoryError = null,
      messageError = null,
      ratingError = null;

  FeedbackState.copy(FeedbackState state)
    : this(
        rating: state.rating,
        message: state.message,
        isLoading: state.isLoading,
        category: state.category,
        errorMessage: state.errorMessage,
        categoryError: state.categoryError,
        messageError: state.messageError,
        ratingError: state.ratingError,
      );

  final double rating;
  final String message;
  final bool isLoading;
  final FeedbackCategory? category;
  final String? errorMessage;
  final String? categoryError;
  final String? messageError;
  final String? ratingError;

  FeedbackState copyWith({
    double? rating,
    String? message,
    bool? isLoading,
    FeedbackCategory? category,
    String? errorMessage,
    String? categoryError,
    String? messageError,
    String? ratingError,
  }) {
    return FeedbackState(
      rating: rating ?? this.rating,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      category: category ?? this.category,
      errorMessage: errorMessage ?? this.errorMessage,
      categoryError: categoryError ?? this.categoryError,
      messageError: messageError ?? this.messageError,
      ratingError: ratingError ?? this.ratingError,
    );
  }

  @visibleForTesting
  const FeedbackState.test({
    this.rating = 0,
    this.message = '',
    this.isLoading = false,
    this.category,
    this.errorMessage,
    this.categoryError,
    this.messageError,
    this.ratingError,
  });

  @override
  List<Object?> get props => [
    rating,
    message,
    isLoading,
    category,
    errorMessage,
    categoryError,
    messageError,
    ratingError,
  ];
}

class FeedbackSubmittedSuccessState extends FeedbackState {
  FeedbackSubmittedSuccessState(super.state) : super.copy();
}

class FeedbackSubmittedFailureState extends FeedbackState {
  FeedbackSubmittedFailureState(super.state) : super.copy();
}
