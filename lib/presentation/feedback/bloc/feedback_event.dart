import 'package:equatable/equatable.dart';
import 'package:skelter/presentation/feedback/enum/feedback_category.dart';

abstract class FeedbackEvent with Equatable {
  const FeedbackEvent();
}

class FeedbackRatingChangedEvent extends FeedbackEvent {
  const FeedbackRatingChangedEvent({required this.rating});

  final double rating;

  @override
  List<Object?> get props => [rating];
}

class FeedbackRatingErrorEvent extends FeedbackEvent {
  const FeedbackRatingErrorEvent({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

class FeedbackCategoryChangedEvent extends FeedbackEvent {
  const FeedbackCategoryChangedEvent({required this.category});

  final FeedbackCategory category;

  @override
  List<Object?> get props => [category];
}

class FeedbackCategoryErrorEvent extends FeedbackEvent {
  const FeedbackCategoryErrorEvent({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

class FeedbackMessageChangedEvent extends FeedbackEvent {
  const FeedbackMessageChangedEvent({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class FeedbackMessageErrorEvent extends FeedbackEvent {
  const FeedbackMessageErrorEvent({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

class FeedbackSubmittedEvent extends FeedbackEvent {
  const FeedbackSubmittedEvent({
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  final String userId;
  final String name;
  final String email;
  final String phoneNumber;

  @override
  List<Object?> get props => [userId, name, email, phoneNumber];
}
