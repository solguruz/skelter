import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class NotificationModel {
  final String id;
  final DateTime insertedOn;
  final String title;
  final String message;
  final bool isSeen;
  final String image;
  final NotificationType notificationType;

  NotificationModel({
    required this.id,
    required this.insertedOn,
    required this.title,
    required this.message,
    required this.isSeen,
    this.image = '',
    this.notificationType = NotificationType.info,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      insertedOn: DateTime.parse(json['insertedOn'] as String),
      title: json['title'] as String,
      message: json['message'] as String,
      isSeen: json['isSeen'] as bool,
      image: json['image'] as String? ?? '',
      notificationType: NotificationType.values.firstWhere(
        (e) => e.name == json['notificationType'],
        orElse: () => NotificationType.info,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'insertedOn': insertedOn.toIso8601String(),
      'title': title,
      'message': message,
      'isSeen': isSeen,
      'image': image,
      'notificationType': notificationType.name,
    };
  }
}

enum NotificationType {
  info,
  shiftSchedule,
  shiftCancel,
  shiftFilled,
  image;

  Icon? get getIcon {
    return switch (this) {
      NotificationType.shiftSchedule => const Icon(
          TablerIcons.calendar_check,
          color: AppColors.white,
          size: 20,
        ),
      NotificationType.shiftFilled => const Icon(
          TablerIcons.calendar_check,
          color: AppColors.white,
          size: 20,
        ),
      NotificationType.shiftCancel => const Icon(
          TablerIcons.calendar_x,
          color: AppColors.white,
          size: 20,
        ),
      _ => null,
    };
  }

  Color? get getBgColor {
    return switch (this) {
      NotificationType.shiftSchedule => AppColors.brand400,
      NotificationType.shiftCancel => AppColors.redError500,
      NotificationType.shiftFilled => AppColors.brand600,
      _ => null
    };
  }
}
