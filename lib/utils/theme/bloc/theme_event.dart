import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class LoadTheme extends ThemeEvent {
  const LoadTheme();
}

class SetThemeModeEvent extends ThemeEvent {
  final ThemeMode mode;
  const SetThemeModeEvent({required this.mode});
  @override
  List<Object?> get props => [mode];
}

class ToggleThemeModeEvent extends ThemeEvent {
  const ToggleThemeModeEvent();
}
