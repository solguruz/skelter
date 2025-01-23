import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/logger/app_logging.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/services/firebase_auth_services.dart';
import 'package:flutter_skeleton/presentation/profile/bloc/profile_event.dart';
import 'package:flutter_skeleton/presentation/profile/bloc/profile_state.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';
import 'package:flutter_skeleton/utils/analytics_helper.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> with Loggable {
  ProfileBloc()
      : super(
          ProfileState.initial(
            name: 'Josh Fernandes',
            email: 'josh@gmail.com',
            isProUser: true,
          ),
        ) {
    _initialiseFirebaseServices();
    _setupEventListener();
  }

  @override
  void onEvent(ProfileEvent event) {
    super.onEvent(event);
    AnalyticsHelper().logCustomEvent(
      event.eventName,
      parameters: event.getAnalyticParameters(),
    );
  }

  @override
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    super.onTransition(transition);
    logD('Transition: $transition');
  }

  @override
  String get className => (ProfileBloc).toString();

  void _setupEventListener() {
    on<UpdateProfileEvent>(_onUpdateProfileEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  void _onUpdateProfileEvent(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.name,
        email: event.email,
        isProUser: event.isProUser,
      ),
    );
  }

  void _onSignOutEvent(
    SignOutEvent event,
    Emitter<ProfileState> emit,
  ) async {
    await Prefs.clear();
    await FirebaseAuthService().signOut();
    emit(SignOutState());
  }

  void _initialiseFirebaseServices() {
    FirebaseAuthService().init();
  }
}

extension ProfileBlocExtension on BuildContext {
  ProfileBloc get profileBloc => BlocProvider.of<ProfileBloc>(this);
}
