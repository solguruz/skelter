import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_bloc.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_event.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_state.dart';
import 'package:flutter_skeleton/presentation/notifications/data/notification_data_list.dart';
import 'package:flutter_skeleton/presentation/notifications/notifications_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class NotificationBlocMock
    extends MockBloc<NotificationEvent, NotificationState>
    implements NotificationBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    setupFirebaseCoreMocks();
    await Firebase.initializeApp(
      name: 'tenantIdTest',
      options: const FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      ),
    );
  });

  group(
    'Notification Page UI Test',
    () {
      testWidgets('Notification Page', (tester) async {
        await tester.runWidgetTest(
          child: const NotificationsPage(),
        );
        expect(find.byType(NotificationsPage), findsOneWidget);
        expect(find.text('Notifications'), findsOneWidget);
      });
      //golden test
      testExecutable(
        () {
          goldenTest(
            'NotificationsPage',
            fileName: 'notifications_page',
            builder: () {
              final notificationBloc = NotificationBlocMock();

              final testState = NotificationState.test().copyWith(
                isLoading: false,
                notificationList: dummyNotifications,
              );
              when(() => notificationBloc.state).thenReturn(testState);

              return GoldenTestGroup(
                columnWidthBuilder: (_) =>
                    const FixedColumnWidth(pixel5DeviceWidth),
                children: [
                  createTestScenario(
                    name: 'Notification Page',
                    addScaffold: true,
                    child: const NotificationPageBody(),
                    providers: [
                      BlocProvider<NotificationBloc>.value(
                        value: notificationBloc,
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}
