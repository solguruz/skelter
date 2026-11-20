import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class BiometricAuthState with Equatable {
  final bool isBiometricEnrolled;
  final bool isBiometricSupported;
  final bool isLoading;
  final String? errorMessage;

  const BiometricAuthState({
    required this.isBiometricEnrolled,
    required this.isBiometricSupported,
    required this.isLoading,
    required this.errorMessage,
  });

  const BiometricAuthState.initial()
    : isBiometricEnrolled = false,
      isBiometricSupported = false,
      isLoading = false,
      errorMessage = null;

  BiometricAuthState.copy(BiometricAuthState state)
    : this(
        isBiometricEnrolled: state.isBiometricEnrolled,
        isBiometricSupported: state.isBiometricSupported,
        isLoading: state.isLoading,
        errorMessage: state.errorMessage,
      );

  BiometricAuthState copyWith({
    bool? isBiometricEnrolled,
    bool? isBiometricSupported,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BiometricAuthState(
      isBiometricEnrolled: isBiometricEnrolled ?? this.isBiometricEnrolled,
      isBiometricSupported: isBiometricSupported ?? this.isBiometricSupported,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @visibleForTesting
  const BiometricAuthState.test({
    this.isBiometricEnrolled = false,
    this.isBiometricSupported = false,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    isBiometricEnrolled,
    isBiometricSupported,
    isLoading,
    errorMessage,
  ];
}

class BiometricAuthSuccessState extends BiometricAuthState {
  BiometricAuthSuccessState(BiometricAuthState state)
    : super.copy(state.copyWith());
}

class BiometricAuthFailureState extends BiometricAuthState {
  BiometricAuthFailureState(BiometricAuthState state)
    : super.copy(state.copyWith());
}

class IsBiometricAuthNotSupportedState extends BiometricAuthState {
  IsBiometricAuthNotSupportedState(
    BiometricAuthState state, {
    required bool isBiometricSupported,
  }) : super.copy(state.copyWith(isBiometricSupported: isBiometricSupported));
}

class BiometricAuthNotEnrolledState extends BiometricAuthState {
  BiometricAuthNotEnrolledState(BiometricAuthState state)
    : super.copy(state.copyWith());
}

class IsBiometricAuthEnabledState extends BiometricAuthState {
  IsBiometricAuthEnabledState(
    BiometricAuthState state, {
    required bool isBiometricEnrolled,
  }) : super.copy(state.copyWith(isBiometricEnrolled: isBiometricEnrolled));
}

class BioMetricsTooManyAttemptState extends BiometricAuthState {
  BioMetricsTooManyAttemptState(BiometricAuthState state)
    : super.copy(state.copyWith());
}
