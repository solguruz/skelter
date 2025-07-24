import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/services/firebase_auth_services.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  DeleteAccountBloc() : super(const DeleteAccountState.initial()) {
    _initialiseFirebaseServices();
    _setupEventListeners();
  }

  void _initialiseFirebaseServices() {
    _firebaseAuthService.init();
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
    emit(
      DeleteAccountLoadingState(
        state,
        isLoading: true,
      ),
    );

    try {
      await _firebaseAuthService.deleteCurrentUser(
        onError: (error, {stackTrace}) {
          if (error == kFirebaseAuthRequiresRecentLogin) {
            emit(
              DeleteAccountReAuthRequiredState(
                state,
                errorMessage: error,
              ),
            );
          } else {
            emit(
              DeleteAccountFailureState(
                state,
                errorMessage: error,
              ),
            );
            emit(
              DeleteAccountLoadingState(
                state,
                isLoading: false,
              ),
            );
          }

          throw Exception(error);
        },
      );

      emit(
        DeleteAccountSuccessState(
          state,
        ),
      );

      emit(
        DeleteAccountLoadingState(
          state,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        DeleteAccountFailureState(
          state,
          errorMessage: kSomethingWentWrong,
        ),
      );

      emit(
        DeleteAccountLoadingState(
          state,
          isLoading: false,
        ),
      );
    }
  }
}
