import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/app_localizations.dart';
import 'package:flutter_skeleton/presentation/login/models/login_details.dart';
import 'package:flutter_skeleton/presentation/signup/enum/user_details_input_status.dart';
import 'package:flutter_skeleton/presentation/verify_email/bloc/verify_email_event.dart';
import 'package:flutter_skeleton/presentation/verify_email/bloc/verify_email_state.dart';
import 'package:flutter_skeleton/services/firebase_auth_services.dart';
import 'package:flutter_skeleton/shared_pref/pref_keys.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';

/// Bloc responsible for managing email verification state and events.
class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final AppLocalizations localizations;
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  VerifyEmailBloc({required this.localizations})
      : super(VerifyEmailInitialState()) {
    on<InitialEvent>(_onInitialEvent);
    on<SendEmailVerificationLinkEvent>(_onSendEmailVerificationLinkEvent);
    on<RestartVerificationMailResendTimerEvent>(
      _onRestartVerificationMailResendTimerEvent,
    );
    on<VerificationCodeFailedToSendEvent>(_onVerificationCodeFailedToSendEvent);
    on<ResendVerificationEmailTimeLeftEvent>(
      _onResendVerificationEmailTimeLeftEvent,
    );
    on<ChangeUserDetailsInputStatusEvent>(_onChangeUserDetailsInputStatusEvent);
    on<NavigateToHomeEvent>(_onNavigateToHomeEvent);
  }

  void _onInitialEvent(
    InitialEvent event,
    Emitter<VerifyEmailState> emit,
  ) {
    emit(state.copyWith(isSignUp: event.isSignUp, email: event.email));
  }

  void _onSendEmailVerificationLinkEvent(
    SendEmailVerificationLinkEvent event,
    Emitter<VerifyEmailState> emit,
  ) async {
    try {
      await _firebaseAuthService.sendVerificationEmail(
        onError: (error, {stackTrace}) {
          add(VerificationCodeFailedToSendEvent());
        },
      );
      add(RestartVerificationMailResendTimerEvent());
    } catch (e) {
      add(VerificationCodeFailedToSendEvent());
    }
  }

  void _onRestartVerificationMailResendTimerEvent(
    RestartVerificationMailResendTimerEvent event,
    Emitter<VerifyEmailState> emit,
  ) {
    emit(RestartVerificationMailResendTimerState(state));
  }

  void _onVerificationCodeFailedToSendEvent(
    VerificationCodeFailedToSendEvent event,
    Emitter<VerifyEmailState> emit,
  ) {
    emit(VerificationCodeFailedToSendState(state));
  }

  void _onResendVerificationEmailTimeLeftEvent(
    ResendVerificationEmailTimeLeftEvent event,
    Emitter<VerifyEmailState> emit,
  ) {
    emit(state.copyWith(resendTimeLeft: event.resendTimeLeft));
  }

  void _onChangeUserDetailsInputStatusEvent(
    ChangeUserDetailsInputStatusEvent event,
    Emitter<VerifyEmailState> emit,
  ) {
    emit(
      state.copyWith(userDetailsInputStatus: UserDetailsInputStatus.inProgress),
    );
  }

  Future<void> storeLoginDetailsInPrefs(User? firebaseUser) async {
    if (firebaseUser == null) return;
    try {
      final token = await firebaseUser.getIdToken();
      final loginDetails = LoginDetails(
        uid: firebaseUser.uid,
        token: token,
        phoneNumber: firebaseUser.phoneNumber,
        email: firebaseUser.email,
      );
      await Prefs.setString(
        PrefKeys.kUserDetails,
        json.encode(loginDetails.toJson()),
      );
    } catch (e) {
      debugPrint('Error storing login details: $e');
    }
  }

  FutureOr<void> _onNavigateToHomeEvent(
    NavigateToHomeEvent event,
    Emitter<VerifyEmailState> emit,
  ) {
    emit(NavigateToHomeState(state));
  }
}
