import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_bloc.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_event.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_state.dart';
import 'package:skelter/presentation/feedback/enum/feedback_category.dart';
import 'package:skelter/presentation/feedback/screens/feedback_screen.dart';
import 'package:skelter/presentation/feedback/widgets/feedback_app_bar.dart';
import 'package:skelter/presentation/feedback/widgets/feedback_submit_button.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockFeedbackBloc extends MockBloc<FeedbackEvent, FeedbackState>
    implements FeedbackBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockAppLocalizations l10n;

  setUp(() {
    l10n = MockAppLocalizations();
    when(
      () => l10n.please_select_a_rating,
    ).thenReturn('Please select a rating to continue.');
    when(
      () => l10n.feedback_category_required,
    ).thenReturn('Please select a category to continue.');
    when(
      () => l10n.please_share_your_thoughts,
    ).thenReturn('Please share your thoughts before submitting.');
  });

  group('Feedback Screen', () {
    testWidgets('renders FeedbackScreenBody', (tester) async {
      //arrange
      final feedbackBloc = MockFeedbackBloc();
      when(() => feedbackBloc.state).thenReturn(const FeedbackState.test());

      //act
      await tester.runWidgetTest(
        providers: [BlocProvider<FeedbackBloc>.value(value: feedbackBloc)],
        child: const Scaffold(body: FeedbackScreenBody()),
      );

      // assert
      expect(find.byType(FeedbackScreenBody), findsOneWidget);
    });

    testExecutable(() {
      goldenTest(
        'Feedback screen default UI test',
        fileName: 'feedback_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          //arrange
          final feedbackBloc = MockFeedbackBloc();
          when(() => feedbackBloc.state).thenReturn(const FeedbackState.test());

          // act, assert
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Feedback screen Light Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<FeedbackBloc>.value(value: feedbackBloc),
                ],
                child: const FeedbackScreenBody(),
              ),
              createTestScenario(
                name: 'Feedback screen Dark Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<FeedbackBloc>.value(value: feedbackBloc),
                ],
                child: const FeedbackScreenBody(),
                theme: AppThemeEnum.DarkTheme,
              ),
            ],
          );
        },
      );
    });

    testExecutable(() {
      goldenTest(
        'Feedback screen filled state UI test',
        fileName: 'feedback_screen_filled',
        pumpBeforeTest: precacheImages,
        builder: () {
          //arrange
          final feedbackBloc = MockFeedbackBloc();
          when(() => feedbackBloc.state).thenReturn(
            const FeedbackState.test(
              rating: 4,
              category: FeedbackCategory.suggestion,
              message: 'Great app! I love the UI design.',
            ),
          );

          // act, assert
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Feedback screen filled Light Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<FeedbackBloc>.value(value: feedbackBloc),
                ],
                child: const FeedbackScreenBody(),
              ),
              createTestScenario(
                name: 'Feedback screen filled Dark Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<FeedbackBloc>.value(value: feedbackBloc),
                ],
                child: const FeedbackScreenBody(),
                theme: AppThemeEnum.DarkTheme,
              ),
            ],
          );
        },
      );
    });

    testExecutable(() {
      goldenTest(
        'Feedback screen error state UI test',
        fileName: 'feedback_screen_error',
        pumpBeforeTest: precacheImages,
        builder: () {
          //arrange
          final feedbackBloc = MockFeedbackBloc();
          when(() => feedbackBloc.state).thenReturn(
            FeedbackState.test(
              ratingError: l10n.please_select_a_rating,
              categoryError: l10n.feedback_category_required,
              messageError: l10n.please_share_your_thoughts,
            ),
          );

          // act, assert
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Feedback screen error Light Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<FeedbackBloc>.value(value: feedbackBloc),
                ],
                child: const FeedbackScreenBody(),
              ),
              createTestScenario(
                name: 'Feedback screen error Dark Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<FeedbackBloc>.value(value: feedbackBloc),
                ],
                child: const FeedbackScreenBody(),
                theme: AppThemeEnum.DarkTheme,
              ),
            ],
          );
        },
      );
    });
  });

  testExecutable(() {
    goldenTest(
      'Feedback app bar UI test',
      fileName: 'feedback_app_bar',
      pumpBeforeTest: precacheImages,
      builder: () {
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Feedback app bar Light Theme',
              addScaffold: true,
              child: const FeedbackAppBar(),
            ),
            createTestScenario(
              name: 'Feedback app bar Dark Theme',
              addScaffold: true,
              child: const FeedbackAppBar(),
              theme: AppThemeEnum.DarkTheme,
            ),
          ],
        );
      },
    );
  });

  testExecutable(() {
    goldenTest(
      'Feedback submit button UI test',
      fileName: 'feedback_submit_button',
      pumpBeforeTest: precacheImages,
      builder: () {
        //arrange
        final feedbackBloc = MockFeedbackBloc();
        when(() => feedbackBloc.state).thenReturn(const FeedbackState.test());

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Feedback submit button Light Theme',
              addScaffold: true,
              providers: [
                BlocProvider<FeedbackBloc>.value(value: feedbackBloc),
              ],
              child: const FeedbackSubmitButton(),
            ),
            createTestScenario(
              name: 'Feedback submit button Dark Theme',
              addScaffold: true,
              providers: [
                BlocProvider<FeedbackBloc>.value(value: feedbackBloc),
              ],
              child: const FeedbackSubmitButton(),
              theme: AppThemeEnum.DarkTheme,
            ),
          ],
        );
      },
    );
  });
}
