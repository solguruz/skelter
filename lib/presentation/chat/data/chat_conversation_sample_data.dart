import 'package:flutter_skeleton/presentation/chat/enum/message_type_enum.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_message_model.dart';

final List<ChatMessage> messages = [
  ChatMessage(
    id: 0,
    message: 'Yes, see you at 6.',
    status: 'Read',
    isSentByMe: false,
    replyingToId: 1,
    messageType: MessageType.text,
    date: DateTime.now(),
  ),
  ChatMessage(
    id: 1,
    message: 'Are we meeting today?',
    status: 'Read',
    isSentByMe: true,
    messageType: MessageType.text,
    date: DateTime.now().subtract(const Duration(hours: 1, minutes: 12)),
  ),
  ChatMessage(
    id: 2,
    message: '',
    status: 'Read',
    isSentByMe: true,
    messageType: MessageType.audio,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  ChatMessage(
    id: 3,
    message: 'Hi, how are you?',
    status: 'Read',
    isSentByMe: false,
    messageType: MessageType.text,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  ChatMessage(
    id: 4,
    message:
        'https://i.pinimg.com/736x/f4/1a/00/f41a006759622e61fc1f887b2e1adf46.jpg',
    status: 'Read',
    isSentByMe: false,
    messageType: MessageType.image,
    date: DateTime.now().subtract(
      const Duration(days: 1, hours: 2),
    ),
  ),
  ChatMessage(
    id: 5,
    message: 'Good day!',
    status: 'Read',
    isSentByMe: true,
    messageType: MessageType.text,
    date: DateTime.now().subtract(const Duration(days: 2, hours: 2)),
  ),
];
