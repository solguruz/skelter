import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/analytics/main_event.dart';

abstract class ProfileEvent extends Equatable implements AnalyticsEvent {
  const ProfileEvent();

  @override
  Map<String, String>? getAnalyticParameters() {
    return {};
  }

  @override
  bool shouldLogEvent() {
    return false;
  }
}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String email;
  final bool isProUser;

  const UpdateProfileEvent({
    required this.name,
    required this.email,
    required this.isProUser,
  });

  @override
  List<Object> get props => [name, email, isProUser];

  @override
  String get eventName => (UpdateProfileEvent).toString();
}

class SignOutEvent extends ProfileEvent {
  const SignOutEvent();

  @override
  List<Object> get props => [];

  @override
  String get eventName => (SignOutEvent).toString();
}
