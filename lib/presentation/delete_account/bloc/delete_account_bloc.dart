import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_state.dart';
import 'package:skelter/presentation/delete_account/constants/delete_account_constants.dart';
import 'package:skelter/services/firebase_auth_services.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  final FirebaseAuthService _firebaseAuthService = sl();

  DeleteAccountBloc() : super(const DeleteAccountState.initial()) {
    _setupEventListeners();
  }

  void _setupEventListeners() {
    on<DeleteReasonSelectedEvent>(_onReasonSelectedEvent);
    on<DeleteOtherReasonTextChangedEvent>(_onOtherReasonTextChangedEvent);
    on<DeleteAccountSubmittedEvent>(_onDeleteAccountSubmittedEvent);
  }

  void _onReasonSelectedEvent(
    DeleteReasonSelectedEvent event,
    Emitter<DeleteAccountState> emit,
  ) {
    emit(
      DeleteAccountInputUpdatedState(
        state,
        selectedReason: event.reason,
        otherReasonText: state.otherReasonText,
      ),
    );
  }

  void _onOtherReasonTextChangedEvent(
    DeleteOtherReasonTextChangedEvent event,
    Emitter<DeleteAccountState> emit,
  ) {
    emit(
      DeleteAccountInputUpdatedState(
        state,
        selectedReason: state.selectedReason,
        otherReasonText: event.text,
      ),
    );
  }

  Future<void> _onDeleteAccountSubmittedEvent(
    DeleteAccountSubmittedEvent event,
    Emitter<DeleteAccountState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    var hasErrorOccurred = false;

    await _firebaseAuthService.deleteCurrentUser(
      onError: (error, {stackTrace}) async {
        hasErrorOccurred = true;

        final user = _firebaseAuthService.getCurrentUser();
        final providerList =
            user?.providerData.map((p) => p.providerId).toList() ?? [];

        if (error == kFirebaseAuthRequiresRecentLogin ||
            error == kEmailPasswordReAuthRequired) {
          if (providerList.contains(kProviderPassword)) {
            emit(
              state.copyWith(
                isLoading: false,
                errorMessage: error,
              ),
            );
            emit(DeleteAccountReAuthEmailPasswordRequiredState(state));
          } else if (providerList.contains(kProviderGoogle)) {
            emit(
              state.copyWith(
                isLoading: false,
                errorMessage: error,
              ),
            );
            emit(DeleteAccountReAuthGoogleRequiredState(state));
          } else {
            emit(
              state.copyWith(
                isLoading: false,
                errorMessage: error,
              ),
            );
            emit(DeleteAccountFailureState(state));
          }
        } else if (error == kPhoneAuthRequired) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: error,
            ),
          );
          emit(DeleteAccountReAuthPhoneRequiredState(state));
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: error,
            ),
          );
          emit(DeleteAccountFailureState(state));
        }
      },
    );

    if (!hasErrorOccurred) {
      emit(state.copyWith(isLoading: false));
      emit(DeleteAccountSuccessState(state));
    }
  }
}
