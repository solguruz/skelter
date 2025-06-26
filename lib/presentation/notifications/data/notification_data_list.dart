import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';

final List<NotificationModel> dummyNotifications = [
  NotificationModel(
    id: '1',
    insertedOn: DateTime.now().subtract(const Duration(hours: 2)),
    title: 'Shift Scheduled!',
    message:
        'Your shift on 12/15/2023 at Rocky Mtn. Care of Heber is cancelled.',
    isSeen: false,
    notificationType: NotificationType.shiftSchedule,
  ),
  NotificationModel(
    id: '2',
    insertedOn: DateTime.now().subtract(const Duration(hours: 2)),
    title: 'Shift Cancelled!',
    message:
        'Your shift on 12/15/2023 at Rocky Mtn. Care of Heber is cancelled.',
    isSeen: false,
    notificationType: NotificationType.shiftCancel,
  ),
  NotificationModel(
    id: '3',
    insertedOn: DateTime.now().subtract(const Duration(days: 2)),
    title: 'Shift Filled!',
    message:
        'The shift you requested on 09/06, 8:00 AM to 5:00 PM has been filled by somewhere else.',
    isSeen: true,
    notificationType: NotificationType.shiftFilled,
  ),
  NotificationModel(
    id: '4',
    insertedOn: DateTime.now().subtract(const Duration(days: 7)),
    title: 'Shift Scheduled!',
    message:
        'Your shift on 12/15/2023 at Rocky Mtn. Care of Heber is cancelled.',
    isSeen: true,
    notificationType: NotificationType.shiftSchedule,
  ),
  NotificationModel(
    id: '5',
    insertedOn: DateTime.now().subtract(const Duration(days: 10, hours: 50)),
    title: 'New Task',
    message: "You've been assigned a new task "
        'Lamp is not Working by Catherine James',
    isSeen: true,
    image:
        'https://plus.unsplash.com/premium_photo-1668005190411-1042cd38522e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGFtcHxlbnwwfHwwfHx8MA%3D%3D',
    notificationType: NotificationType.image,
  ),
];
