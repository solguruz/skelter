import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/subscription/model/subscription_package_model.dart';

class SubscriptionState with Equatable {
  final List<SubscriptionPackageModel> packages;
  final SubscriptionPackageModel? selectedPackage;
  final bool isLoadingPackages;
  final bool isProcessingPayment;
  final bool isRestoring;
  final String? errorMessage;
  final String? restoreStatusMessage;

  SubscriptionState({
    required this.packages,
    required this.selectedPackage,
    required this.isLoadingPackages,
    required this.isProcessingPayment,
    required this.isRestoring,
    this.errorMessage,
    this.restoreStatusMessage,
  });

  SubscriptionState.initial()
    : packages = [],
      selectedPackage = null,
      isLoadingPackages = true,
      isProcessingPayment = false,
      isRestoring = false,
      errorMessage = null,
      restoreStatusMessage = null;

  SubscriptionState.copy(SubscriptionState state)
    : packages = state.packages,
      selectedPackage = state.selectedPackage,
      isLoadingPackages = state.isLoadingPackages,
      isProcessingPayment = state.isProcessingPayment,
      isRestoring = state.isRestoring,
      errorMessage = state.errorMessage,
      restoreStatusMessage = state.restoreStatusMessage;

  SubscriptionState copyWith({
    List<SubscriptionPackageModel>? packages,
    SubscriptionPackageModel? selectedPackage,
    bool? isLoadingPackages,
    bool? isProcessingPayment,
    bool? isRestoring,
    String? errorMessage,
    String? restoreStatusMessage,
    bool clearSnackBar = false,
  }) {
    return SubscriptionState(
      packages: packages ?? this.packages,
      selectedPackage: selectedPackage ?? this.selectedPackage,
      isLoadingPackages: isLoadingPackages ?? this.isLoadingPackages,
      isProcessingPayment: isProcessingPayment ?? this.isProcessingPayment,
      isRestoring: isRestoring ?? this.isRestoring,
      errorMessage: errorMessage ?? this.errorMessage,
      restoreStatusMessage: clearSnackBar
          ? null
          : restoreStatusMessage ?? this.restoreStatusMessage,
    );
  }

  @visibleForTesting
  SubscriptionState.test({
    this.packages = const [],
    this.selectedPackage,
    this.isLoadingPackages = false,
    this.isProcessingPayment = false,
    this.isRestoring = false,
    this.errorMessage,
    this.restoreStatusMessage,
  });

  @override
  List<Object?> get props => [
    packages,
    selectedPackage,
    isLoadingPackages,
    isProcessingPayment,
    isRestoring,
    errorMessage,
    restoreStatusMessage,
  ];
}

class FetchSubscriptionPlanLoadingState extends SubscriptionState {
  FetchSubscriptionPlanLoadingState() : super.copy(SubscriptionState.initial());
}

class FetchSubscriptionPlanLoadedState extends SubscriptionState {
  FetchSubscriptionPlanLoadedState(super.state) : super.copy();
}

class FetchSubscriptionPlanFailureState extends SubscriptionState {
  FetchSubscriptionPlanFailureState(
    SubscriptionState state, {
    required String error,
  }) : super.copy(
         state.copyWith(errorMessage: error, isLoadingPackages: false),
       );
}

class SubscriptionPaymentProcessingState extends SubscriptionState {
  SubscriptionPaymentProcessingState(SubscriptionState state)
    : super.copy(state.copyWith(isProcessingPayment: true));
}

class SubscriptionPaymentSuccessState extends SubscriptionState {
  SubscriptionPaymentSuccessState(SubscriptionState state)
    : super.copy(state.copyWith(isProcessingPayment: false));
}

class SubscriptionPaymentFailureState extends SubscriptionState {
  SubscriptionPaymentFailureState(
    SubscriptionState state, {
    required String error,
  }) : super.copy(
         state.copyWith(errorMessage: error, isProcessingPayment: false),
       );
}
