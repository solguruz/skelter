import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/profile/bloc/profile_event.dart';
import 'package:skelter/presentation/profile/bloc/profile_state.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/cache_manager.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(
          ProfileState.initial(
            name: 'Josh Fernandes',
            email: 'josh@gmail.com',
            isProUser: true,
          ),
        ) {
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
    try {
      await Prefs.clear();
      await sl<CacheManager>().clearCachedApiResponse();
      await FirebaseAuthService().signOut();
      emit(SignOutState());
    } catch (e) {
      debugPrint('Error signing out: $e');
      emit(SignOutErrorState(errorMessage: e.toString()));
    }
  }
}
