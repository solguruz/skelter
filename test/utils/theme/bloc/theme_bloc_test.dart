import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/services/theme_service.dart';
import 'package:skelter/utils/theme/bloc/theme_bloc.dart';
import 'package:skelter/utils/theme/bloc/theme_event.dart';
import 'package:skelter/utils/theme/bloc/theme_state.dart';

class MockThemeService extends Mock implements ThemeService {}

void main() {
  late MockThemeService mockThemeService;

  setUp(() {
    mockThemeService = MockThemeService();
  });

  group('ThemeBloc Initialization', () {
    blocTest<ThemeBloc, ThemeState>(
      'should emit initial state with default system theme mode',
      build: () => ThemeBloc(service: mockThemeService),
      expect: () => <ThemeState>[],
      verify: (bloc) {
        expect(bloc.state.themeMode, ThemeMode.system);
      },
    );
  });

  group('ThemeBloc LoadTheme Event', () {
    blocTest<ThemeBloc, ThemeState>(
      'should emit state with system theme mode when no saved preference',
      build: () {
        when(() => mockThemeService.getThemeMode())
            .thenAnswer((_) async => ThemeMode.system);
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) => bloc.add(const LoadTheme()),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode system',
          ThemeMode.system,
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'should emit state with light theme mode when saved preference is light',
      build: () {
        when(() => mockThemeService.getThemeMode())
            .thenAnswer((_) async => ThemeMode.light);
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) => bloc.add(const LoadTheme()),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode light',
          ThemeMode.light,
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'should emit state with dark theme mode when saved preference is dark',
      build: () {
        when(() => mockThemeService.getThemeMode())
            .thenAnswer((_) async => ThemeMode.dark);
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) => bloc.add(const LoadTheme()),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
      ],
    );
  });

  group('ThemeBloc SetThemeModeEvent', () {
    blocTest<ThemeBloc, ThemeState>(
      'should save and emit light theme mode',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.light))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) => bloc.add(const SetThemeModeEvent(mode: ThemeMode.light)),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode light',
          ThemeMode.light,
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'should save and emit dark theme mode',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.dark))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) => bloc.add(const SetThemeModeEvent(mode: ThemeMode.dark)),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'should save and emit system theme mode',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.system))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) => bloc.add(const SetThemeModeEvent(mode: ThemeMode.system)),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode system',
          ThemeMode.system,
        ),
      ],
    );
  });

  group('ThemeBloc ToggleThemeModeEvent', () {
    blocTest<ThemeBloc, ThemeState>(
      'should toggle from system to light theme mode',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.light))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) => bloc.add(const ToggleThemeModeEvent()),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode light',
          ThemeMode.light,
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'should toggle from light to dark theme mode',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.light))
            .thenAnswer((_) async => {});
        when(() => mockThemeService.saveThemeMode(ThemeMode.dark))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) {
        bloc.add(const SetThemeModeEvent(mode: ThemeMode.light));
        bloc.add(const ToggleThemeModeEvent());
      },
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode light',
          ThemeMode.light,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'should toggle from dark to system theme mode',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.dark))
            .thenAnswer((_) async => {});
        when(() => mockThemeService.saveThemeMode(ThemeMode.system))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) {
        bloc.add(const SetThemeModeEvent(mode: ThemeMode.dark));
        bloc.add(const ToggleThemeModeEvent());
      },
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode system',
          ThemeMode.system,
        ),
      ],
    );
  });

  group('ThemeBloc Multiple Events', () {
    blocTest<ThemeBloc, ThemeState>(
      'should handle multiple SetThemeModeEvent calls',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.light))
            .thenAnswer((_) async => {});
        when(() => mockThemeService.saveThemeMode(ThemeMode.dark))
            .thenAnswer((_) async => {});
        when(() => mockThemeService.saveThemeMode(ThemeMode.system))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) {
        bloc.add(const SetThemeModeEvent(mode: ThemeMode.light));
        bloc.add(const SetThemeModeEvent(mode: ThemeMode.dark));
        bloc.add(const SetThemeModeEvent(mode: ThemeMode.system));
      },
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode light',
          ThemeMode.light,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode system',
          ThemeMode.system,
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'should handle multiple ToggleThemeModeEvent calls',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.light))
            .thenAnswer((_) async => {});
        when(() => mockThemeService.saveThemeMode(ThemeMode.dark))
            .thenAnswer((_) async => {});
        when(() => mockThemeService.saveThemeMode(ThemeMode.system))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) {
        bloc.add(const ToggleThemeModeEvent());
        bloc.add(const ToggleThemeModeEvent());
        bloc.add(const ToggleThemeModeEvent());
      },
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode light',
          ThemeMode.light,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode system',
          ThemeMode.system,
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      'should handle LoadTheme followed by SetThemeModeEvent',
      build: () {
        when(() => mockThemeService.getThemeMode())
            .thenAnswer((_) async => ThemeMode.dark);
        when(() => mockThemeService.saveThemeMode(ThemeMode.light))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) {
        bloc.add(const LoadTheme());
        bloc.add(const SetThemeModeEvent(mode: ThemeMode.light));
      },
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode light',
          ThemeMode.light,
        ),
      ],
    );
  });

  group('ThemeBloc State Persistence', () {
    blocTest<ThemeBloc, ThemeState>(
      'should emit ThemeMode.dark and keep it as the final state after '
      'SetThemeModeEvent',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.dark))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) {
        bloc.add(const SetThemeModeEvent(mode: ThemeMode.dark));
      },
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
      ],
      verify: (bloc) {
        expect(bloc.state.themeMode, ThemeMode.dark);
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'should emit light, dark, and system theme mode in order and keep system '
      'as final state after repeated ToggleThemeModeEvent',
      build: () {
        when(() => mockThemeService.saveThemeMode(ThemeMode.light))
            .thenAnswer((_) async => {});
        when(() => mockThemeService.saveThemeMode(ThemeMode.dark))
            .thenAnswer((_) async => {});
        when(() => mockThemeService.saveThemeMode(ThemeMode.system))
            .thenAnswer((_) async => {});
        return ThemeBloc(service: mockThemeService);
      },
      act: (bloc) {
        bloc.add(const ToggleThemeModeEvent());
        bloc.add(const ToggleThemeModeEvent());
        bloc.add(const ToggleThemeModeEvent());
      },
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode light',
          ThemeMode.light,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode dark',
          ThemeMode.dark,
        ),
        isA<ThemeState>().having(
          (state) => state.themeMode,
          'ThemeMode system',
          ThemeMode.system,
        ),
      ],
      verify: (bloc) {
        expect(bloc.state.themeMode, ThemeMode.system);
      },
    );
  });
}
