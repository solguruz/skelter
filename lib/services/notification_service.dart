import 'dart:async';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:skelter/presentation/reminder/model/reminder_model.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Background Message data: ${message.data}');
}

class NotificationService {
  NotificationService._();

  // Channel constants
  final basicChannel = 'basic_channel';
  final basicChannelName = 'Basic notifications';
  final basicChannelDescription =
      'Notification channel for basic notifications';
  final basicChannelSound = 'resource://raw/basic';
  final reminderChannel = 'reminder_channel';
  final reminderChannelName = 'Reminders';
  final reminderChannelDescription = 'Notification channel for reminders';
  final reminderChannelSound = 'resource://raw/reminder';
  final appIcon = 'resource://drawable/ic_notification';
  final defaultNotificationTitle = 'New Notification';
  final defaultNotificationBody = '';

  static final NotificationService instance = NotificationService._();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AwesomeNotifications _awesomeNotifications = AwesomeNotifications();

  final _onNotificationTapController = StreamController<Map<String, dynamic>>();

  StreamSubscription<RemoteMessage>? _onMessageSubscription;
  StreamSubscription<RemoteMessage>? _onMessageOpenedAppSubscription;
  StreamSubscription<String>? _onRegisteredSubscription;

  RemoteMessage? _initialMessage;

  Stream<Map<String, dynamic>> get onNotificationTap =>
      _onNotificationTapController.stream;

  Map<String, dynamic>? get initialNotificationPayload => _initialMessage?.data;

  Future<void> initialize() async {
    await _initializeAwesomeNotifications();
    await _requestPermissions();
    await _setupFCMListeners();
    await _registerFCM();
  }

  Future<void> _initializeAwesomeNotifications() async {
    await _awesomeNotifications.initialize(appIcon, [
      NotificationChannel(
        channelKey: basicChannel,
        channelName: basicChannelName,
        channelDescription: basicChannelDescription,
        ledColor: AppColors.white,
        defaultColor: AppColors.brand500,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        playSound: true,
        soundSource: basicChannelSound,
        enableVibration: true,
      ),
      NotificationChannel(
        channelKey: reminderChannel,
        channelName: reminderChannelName,
        channelDescription: reminderChannelDescription,
        ledColor: AppColors.white,
        defaultColor: AppColors.brand500,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        playSound: true,
        soundSource: reminderChannelSound,
        enableVibration: true,
      ),
    ], debug: kDebugMode);

    await _awesomeNotifications.setListeners(
      onActionReceivedMethod: _onActionReceivedMethod,
      onNotificationCreatedMethod: _onNotificationCreatedMethod,
      onNotificationDisplayedMethod: _onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: _onDismissActionReceivedMethod,
    );
  }

  Future<void> _requestPermissions() async {
    final isAllowed = await _awesomeNotifications.isNotificationAllowed();
    if (!isAllowed) {
      await _awesomeNotifications.requestPermissionToSendNotifications();
    }

    final settings = await _firebaseMessaging.requestPermission();
    debugPrint('FCM Permission granted: ${settings.authorizationStatus}');
  }

  Future<void> _setupFCMListeners() async {
    _onMessageSubscription = FirebaseMessaging.onMessage.listen(
      _handleForegroundMessage,
    );
    _onMessageOpenedAppSubscription = FirebaseMessaging.onMessageOpenedApp
        .listen(_handleMessageOpenedApp);

    _initialMessage = await _firebaseMessaging.getInitialMessage();
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    if (Platform.isIOS) {
      return;
    }

    final notification = message.notification;
    final data = message.data;

    debugPrint('Foreground Message data: $data');

    if (notification != null) {
      await showNotification(
        data: data,
        imageUrl:
            notification.android?.imageUrl ?? notification.apple?.imageUrl,
        notification: notification,
      );
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    _onNotificationTapController.add(message.data);
  }

  Future<void> _registerFCM() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        debugPrint('User not logged in, skipping FCM registration');
        return;
      }
      final apnsToken = await _firebaseMessaging.getAPNSToken();
      debugPrint('APNS Token: $apnsToken');

      _onRegisteredSubscription = _firebaseMessaging.onRegistered.listen((
        registrationId,
      ) {
        debugPrint('FCM registration ID: $registrationId');
      });
      await _firebaseMessaging.register();
    } catch (e) {
      debugPrint('Error registering with FCM: $e');
    }
  }

  Future<void> showNotification({
    Map<String, dynamic>? data,
    String? imageUrl,
    RemoteNotification? notification,
  }) async {
    // Create a unique ID for each notification
    int notificationId;
    if (data?['notification_id'] != null) {
      // Convert UUID to a valid 32-bit integer by hashing
      final notificationIdStr = data!['notification_id'].toString();
      // Simple hash function that produces a 31-bit positive integer
      // (avoiding sign issues)
      notificationId = notificationIdStr.hashCode & 0x7FFFFFFF;
    } else {
      // Fallback to timestamp but ensure it's within 32-bit range
      notificationId = DateTime.now().millisecondsSinceEpoch & 0x7FFFFFFF;
    }

    await _awesomeNotifications.createNotification(
      content: NotificationContent(
        id: notificationId,
        channelKey: basicChannel,
        title: notification?.title ?? defaultNotificationTitle,
        body: notification?.body ?? defaultNotificationBody,
        payload: data?.cast(),
        bigPicture: imageUrl,
        notificationLayout: imageUrl != null
            ? NotificationLayout.BigPicture
            : NotificationLayout.Default,
        wakeUpScreen: true,
        category: NotificationCategory.Message,
      ),
    );
  }

  @pragma('vm:entry-point')
  static Future<void> _onNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Notification created callback
  }

  @pragma('vm:entry-point')
  static Future<void> _onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Notification displayed callback
  }

  @pragma('vm:entry-point')
  static Future<void> _onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    final payloadMap = receivedAction.payload ?? {};
    instance._onNotificationTapController.add(payloadMap);
  }

  @pragma('vm:entry-point')
  static Future<void> _onDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    // Notification dismissed callback
  }

  Future<bool> scheduleReminder(ReminderModel reminder) async {
    try {
      // Convert ID to a valid 32-bit integer by hashing
      // Simple hash function that produces a 31-bit positive integer
      // (avoiding sign issues)
      final notificationId = reminder.id.toString().hashCode & 0x7FFFFFFF;

      await _awesomeNotifications.createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: reminderChannel,
          title: reminder.title,
          body: reminder.description,
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          autoDismissible: false,
        ),
        schedule: NotificationCalendar.fromDate(
          date: reminder.scheduledDateTime,
          allowWhileIdle: true,
          preciseAlarm: true,
        ),
      );
      return true;
    } catch (e) {
      debugPrint('Error scheduling reminder: $e');
      return false;
    }
  }

  void dispose() {
    _onMessageSubscription?.cancel();
    _onMessageOpenedAppSubscription?.cancel();
    _onRegisteredSubscription?.cancel();
    _onNotificationTapController.close();
  }
}
