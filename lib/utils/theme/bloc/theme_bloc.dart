import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:skelter/services/theme_service.dart';
import 'package:skelter/utils/theme/bloc/theme_event.dart';
import 'package:skelter/utils/theme/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeService service;

  ThemeBloc({required this.service}) : super(const ThemeState()) {
    on<LoadTheme>(_onLoad);
    on<SetThemeModeEvent>(_onSetMode);
    on<ToggleThemeModeEvent>(_onToggleMode);
  }

  Future<void> _onLoad(LoadTheme event, Emitter<ThemeState> emit) async {
    final savedMode = await service.getThemeMode();
    emit(state.copyWith(themeMode: savedMode));
  }

  Future<void> _onSetMode(
    SetThemeModeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    await service.saveThemeMode(event.mode);
    emit(state.copyWith(themeMode: event.mode));
  }

  Future<void> _onToggleMode(
    ToggleThemeModeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final next = switch (state.themeMode) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
      null => ThemeMode.system,
    };
    await service.saveThemeMode(next);
    emit(state.copyWith(themeMode: next));
  }
}
