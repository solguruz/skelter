import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/ai_chat/bloc/ai_chat_bloc.dart';
import 'package:skelter/presentation/ai_chat/bloc/ai_chat_event.dart';
import 'package:skelter/presentation/ai_chat/bloc/ai_chat_state.dart';
import 'package:skelter/presentation/ai_chat/widgets/ai_chat_bottom_sheet.dart';
import 'package:skelter/presentation/home/data/dummy_product_data.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';
import 'data/ai_chat_sample_data.dart';

class MockAiChatBloc extends MockBloc<AiChatEvent, AiChatState>
    implements AiChatBloc {}

Future<void> _pumpModalAndSettle(WidgetTester tester) async {
  await precacheImages(tester);
  await tester.pumpAndSettle();
}

MockAiChatBloc _buildMockBloc(AiChatState state) {
  final bloc = MockAiChatBloc();
  when(() => bloc.state).thenReturn(state);
  when(() => bloc.products).thenReturn(dummyProductData);
  return bloc;
}

class _SheetHarness extends StatefulWidget {
  const _SheetHarness({required this.bloc});

  final AiChatBloc bloc;

  @override
  State<_SheetHarness> createState() => _SheetHarnessState();
}

class _SheetHarnessState extends State<_SheetHarness> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      showAiChatBottomSheet(
        context,
        existingBloc: widget.bloc,
        onCartTap: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.black);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockLocalizations = MockAppLocalizations();
  when(
    () => mockLocalizations.ai_chat_error_generic,
  ).thenReturn('Something went wrong. Please try again.');

  testExecutable(() {
    goldenTest(
      'AI chat bottom sheet empty state UI test',
      fileName: 'ai_chat_bottom_sheet_empty',
      pumpBeforeTest: _pumpModalAndSettle,
      builder: () {
        final mockBloc = _buildMockBloc(const AiChatState.test());

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'ai_chat_bottom_sheet_empty Light Theme',
              providers: [BlocProvider<AiChatBloc>.value(value: mockBloc)],
              child: _SheetHarness(bloc: mockBloc),
            ),
            createTestScenario(
              name: 'ai_chat_bottom_sheet_empty Dark Theme',
              providers: [BlocProvider<AiChatBloc>.value(value: mockBloc)],
              theme: AppThemeEnum.DarkTheme,
              child: _SheetHarness(bloc: mockBloc),
            ),
          ],
        );
      },
    );

    goldenTest(
      'AI chat bottom sheet with messages UI test',
      fileName: 'ai_chat_bottom_sheet_with_messages',
      pumpBeforeTest: _pumpModalAndSettle,
      builder: () {
        final mockBloc = _buildMockBloc(
          AiChatState.test(messages: sampleAiChatMessages),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'ai_chat_bottom_sheet_with_messages Light Theme',
              providers: [BlocProvider<AiChatBloc>.value(value: mockBloc)],
              child: _SheetHarness(bloc: mockBloc),
            ),
            createTestScenario(
              name: 'ai_chat_bottom_sheet_with_messages Dark Theme',
              providers: [BlocProvider<AiChatBloc>.value(value: mockBloc)],
              theme: AppThemeEnum.DarkTheme,
              child: _SheetHarness(bloc: mockBloc),
            ),
          ],
        );
      },
    );

    goldenTest(
      'AI chat bottom sheet error state UI test',
      fileName: 'ai_chat_bottom_sheet_error',
      pumpBeforeTest: _pumpModalAndSettle,
      builder: () {
        final mockBloc = _buildMockBloc(
          AiChatState.test(
            messages: sampleAiChatMessagesWithError,
            errorMessage: mockLocalizations.ai_chat_error_generic,
          ),
        );

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'ai_chat_bottom_sheet_error Light Theme',
              providers: [BlocProvider<AiChatBloc>.value(value: mockBloc)],
              child: _SheetHarness(bloc: mockBloc),
            ),
            createTestScenario(
              name: 'ai_chat_bottom_sheet_error Dark Theme',
              providers: [BlocProvider<AiChatBloc>.value(value: mockBloc)],
              theme: AppThemeEnum.DarkTheme,
              child: _SheetHarness(bloc: mockBloc),
            ),
          ],
        );
      },
    );
  });
}
