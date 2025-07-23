import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_skeleton/presentation/delete_account/enum/delete_account_reasons.dart';

class DeleteAccountState with EquatableMixin {
  final DeleteAccountReasons? selectedReason;
  final String otherReasonText;
  final bool isLoading;
  final String? errorMessage;

  const DeleteAccountState({
    required this.selectedReason,
    required this.otherReasonText,
    required this.isLoading,
    required this.errorMessage,
  });

  const DeleteAccountState.initial()
      : selectedReason = null,
        otherReasonText = '',
        isLoading = false,
        errorMessage = null;

  DeleteAccountState.copy(DeleteAccountState state)
      : this(
          selectedReason: state.selectedReason,
          otherReasonText: state.otherReasonText,
          isLoading: state.isLoading,
          errorMessage: state.errorMessage,
        );

  DeleteAccountState copyWith({
    DeleteAccountReasons? selectedReason,
    String? otherReasonText,
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return DeleteAccountState(
      selectedReason: selectedReason ?? this.selectedReason,
      otherReasonText: otherReasonText ?? this.otherReasonText,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @visibleForTesting
  const DeleteAccountState.test({
    this.selectedReason,
    this.otherReasonText = '',
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        selectedReason,
        otherReasonText,
        isLoading,
        errorMessage,
      ];
}

class DeleteAccountLoadingState extends DeleteAccountState {
  DeleteAccountLoadingState(
    DeleteAccountState state, {
    required bool isLoading,
  }) : super.copy(
          state.copyWith(
            isLoading: isLoading,
          ),
        );
}

class DeleteAccountSuccessState extends DeleteAccountState {
  DeleteAccountSuccessState(DeleteAccountState state)
      : super.copy(
          state.copyWith(),
        );
}

class DeleteAccountFailureState extends DeleteAccountState {
  DeleteAccountFailureState(
    DeleteAccountState state, {
    required String errorMessage,
  }) : super.copy(
          state.copyWith(
            errorMessage: errorMessage,
          ),
        );
}

class DeleteAccountInputUpdatedState extends DeleteAccountState {
  DeleteAccountInputUpdatedState(
    DeleteAccountState state, {
    required DeleteAccountReasons? selectedReason,
    required String otherReasonText,
  }) : super.copy(
          state.copyWith(
            selectedReason: selectedReason,
            otherReasonText: otherReasonText,
          ),
        );
}

class DeleteAccountReAuthRequiredState extends DeleteAccountState {
  DeleteAccountReAuthRequiredState(
    DeleteAccountState state, {
    required String errorMessage,
  }) : super.copy(
          state.copyWith(
            errorMessage: errorMessage,
          ),
        );
}
