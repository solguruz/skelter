import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_state.dart';
import 'package:flutter_skeleton/presentation/delete_account/delete_account_screen.dart';
import 'package:flutter_skeleton/presentation/delete_account/enum/delete_account_reasons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockDeleteAccountBloc
    extends MockBloc<DeleteAccountEvent, DeleteAccountState>
    implements DeleteAccountBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    setupFirebaseCoreMocks();
    await Firebase.initializeApp(
      name: 'test',
      options: const FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      ),
    );
  });

  group(
    'Delete Account Page UI Test',
    () {
      testWidgets('renders DeleteAccountScreen', (tester) async {
        await tester.runWidgetTest(
          child: const DeleteAccountScreen(),
        );
        expect(find.byType(DeleteAccountScreen), findsOneWidget);
      });

      testExecutable(() {
        goldenTest(
          'No reason selected',
          fileName: 'no_reason_selected',
          builder: () {
            final deleteAccountBloc = MockDeleteAccountBloc();

            const deleteAccountState = DeleteAccountState.test();

            when(() => deleteAccountBloc.state).thenReturn(deleteAccountState);

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: 'No reason selected',
                  addScaffold: true,
                  child: const DeleteAccountScreen(),
                  providers: [
                    BlocProvider<DeleteAccountBloc>.value(
                      value: deleteAccountBloc,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });

      testExecutable(() {
        goldenTest(
          'Selected Reason: I don\'t need it any more',
          fileName: 'selected_reason_i_dont_need_it_any_more',
          builder: () {
            final deleteAccountBloc = MockDeleteAccountBloc();

            const testState = DeleteAccountState.test(
              selectedReason: DeleteAccountReasons.doNotNeedItAnyMore,
            );

            when(() => deleteAccountBloc.state).thenReturn(testState);

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: 'Selected Reason: I don\'t need it any more',
                  addScaffold: true,
                  child: const DeleteAccountBody(),
                  providers: [
                    BlocProvider<DeleteAccountBloc>.value(
                      value: deleteAccountBloc,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });

      testExecutable(() {
        goldenTest(
          'Selected Reason: Other',
          fileName: 'selected_reason_other_with_empty_field',
          builder: () {
            final deleteAccountBloc = MockDeleteAccountBloc();

            const testState = DeleteAccountState.test(
              selectedReason: DeleteAccountReasons.other,
            );

            when(() => deleteAccountBloc.state).thenReturn(testState);

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: 'Selected Reason: Other with empty field',
                  addScaffold: true,
                  child: const DeleteAccountBody(),
                  providers: [
                    BlocProvider<DeleteAccountBloc>.value(
                      value: deleteAccountBloc,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });

      testExecutable(() {
        goldenTest(
          'Selected Reason: Product is no more longer relevant',
          fileName: 'selected_reason_product_no_more_relevant',
          builder: () {
            final deleteAccountBloc = MockDeleteAccountBloc();

            const testState = DeleteAccountState.test(
              selectedReason: DeleteAccountReasons.productNoMoreRelevant,
            );

            when(() => deleteAccountBloc.state).thenReturn(testState);

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: 'Selected Reason: Product are no more longer relevant',
                  addScaffold: true,
                  child: const DeleteAccountBody(),
                  providers: [
                    BlocProvider<DeleteAccountBloc>.value(
                      value: deleteAccountBloc,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });

      testExecutable(() {
        goldenTest(
          'Selected Reason: I dislike the app',
          fileName: 'selected_reason_i_dont_like_the_app',
          builder: () {
            final deleteAccountBloc = MockDeleteAccountBloc();

            const testState = DeleteAccountState.test(
              selectedReason: DeleteAccountReasons.dislikeTheApp,
            );

            when(() => deleteAccountBloc.state).thenReturn(testState);

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: 'Selected Reason: I don\'t like to be on this app',
                  addScaffold: true,
                  child: const DeleteAccountBody(),
                  providers: [
                    BlocProvider<DeleteAccountBloc>.value(
                      value: deleteAccountBloc,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });

      testExecutable(() {
        goldenTest(
          'Selected Reason: Other',
          fileName: 'selected_reason_other_with_filled_field',
          builder: () {
            final deleteAccountBloc = MockDeleteAccountBloc();

            const testState = DeleteAccountState.test(
              selectedReason: DeleteAccountReasons.other,
              otherReasonText:
                  'I appreciate the efforts behind this application, '
                  'but I have decided to stop using it as my needs have changed.'
                  'The app has a clean interface and thoughtful design, '
                  'but some features I require are currently missing.',
            );

            when(() => deleteAccountBloc.state).thenReturn(testState);

            return GoldenTestGroup(
              columnWidthBuilder: (_) =>
                  const FixedColumnWidth(pixel5DeviceWidth),
              children: [
                createTestScenario(
                  name: 'Selected Reason: Other with filled field',
                  addScaffold: true,
                  child: const DeleteAccountBody(),
                  providers: [
                    BlocProvider<DeleteAccountBloc>.value(
                      value: deleteAccountBloc,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });
    },
  );
}
