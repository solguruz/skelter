import 'package:equatable/equatable.dart';

abstract class BiometricAuthEvent with Equatable {
  const BiometricAuthEvent();
}

class BiometricAuthToggleEvent extends BiometricAuthEvent {
  final bool isBiometricEnabled;

  const BiometricAuthToggleEvent({required this.isBiometricEnabled});

  @override
  List<Object?> get props => [isBiometricEnabled];
}

class GetBiometricEnrolledStatusEvent extends BiometricAuthEvent {
  const GetBiometricEnrolledStatusEvent();

  @override
  List<Object?> get props => [];
}
