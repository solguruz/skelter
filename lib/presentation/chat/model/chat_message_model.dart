import 'package:flutter_skeleton/presentation/chat/enum/message_type_enum.dart';

class ChatMessage {
  final int id;
  final String message;
  final String status;
  final bool isSentByMe;
  final DateTime date;
  final int? replyingToId;
  final MessageType messageType;

  ChatMessage({
    required this.id,
    required this.message,
    required this.status,
    required this.isSentByMe,
    required this.date,
    required this.messageType,
    this.replyingToId,
  });
}
