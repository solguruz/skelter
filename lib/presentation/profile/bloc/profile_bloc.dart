import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/services/firebase_auth_services.dart';
import 'package:flutter_skeleton/presentation/profile/bloc/profile_event.dart';
import 'package:flutter_skeleton/presentation/profile/bloc/profile_state.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
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
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    super.onTransition(transition);
    debugPrint('Transition: $transition');
  }

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
