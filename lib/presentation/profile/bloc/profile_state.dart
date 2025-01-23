import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ProfileState with EquatableMixin {
  final String name;
  final String email;
  final bool isProUser;

  ProfileState({
    required this.name,
    required this.email,
    required this.isProUser,
  });

  ProfileState.initial({
    this.name = '',
    this.email = '',
    this.isProUser = false,
  });

  ProfileState.copy(ProfileState state)
      : name = state.name,
        email = state.email,
        isProUser = state.isProUser;

  ProfileState copyWith({
    String? name,
    String? email,
    bool? isProUser,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      isProUser: isProUser ?? this.isProUser,
    );
  }

  @visibleForTesting
  ProfileState.test({
    String? name,
    String? email,
    bool? isProUser,
  })  : name = name ?? '',
        email = email ?? '',
        isProUser = isProUser ?? false;

  @override
  List<Object?> get props => [
        name,
        email,
        isProUser,
      ];
}

class SignOutState extends ProfileState {
  SignOutState() : super.initial();
}
