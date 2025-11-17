import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState with EquatableMixin {
  final ThemeMode? themeMode;

  const ThemeState({this.themeMode = ThemeMode.system});

  ThemeState copyWith({ThemeMode? themeMode}) => ThemeState(
        themeMode: themeMode ?? this.themeMode,
      );

  @visibleForTesting
  const ThemeState.test({
    this.themeMode = ThemeMode.system,
  });

  @override
  List<Object?> get props => [themeMode];
}
