import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';

List<ChatModel> generateSampleUsersChat() {
  final List<Map<String, dynamic>> userData = [
    {
      'name': 'Alice Johnson',
      'profile_picture': 'https://randomuser.me/api/portraits/women/1.jpg',
      'last_message': 'Hey, are we still on for today?',
      'last_message_attachment_url': '',
      'last_message_time': DateTime(2025, 4, 11, 8, 20).toIso8601String(),
      'unread_message_count': 0,
      'is_online': true,
      'isTeam': false,
    },
    {
      'name': 'Bob Smith',
      'profile_picture': 'https://randomuser.me/api/portraits/men/2.jpg',
      'last_message': 'Sure, see you there!',
      'last_message_attachment_url': '',
      'last_message_time': DateTime(2025, 4, 11, 8).toIso8601String(),
      'unread_message_count': 1,
      'is_online': false,
    },
    {
      'name': 'Admin Team',
      'profile_picture': 'https://randomuser.me/api/portraits/women/1.jpg',
      'last_message': 'Hey, are we still on for today?',
      'last_message_attachment_url': '',
      'last_message_time': DateTime(2025, 4, 11, 7, 45).toIso8601String(),
      'unread_message_count': 0,
      'is_online': true,
      'isTeam': true,
    },
    {
      'name': 'Charlie Brown',
      'profile_picture': 'https://randomuser.me/api/portraits/men/3.jpg',
      'last_message': 'Check out this photo!',
      'last_message_attachment_url':
          'https://randomuser.me/api/portraits/men/3.jpg',
      'last_message_time': DateTime(2025, 4, 11, 5, 25).toIso8601String(),
      'unread_message_count': 3,
      'is_online': true,
      'isTeam': false,
    },
    {
      'name': 'Credentialing Team',
      'profile_picture': 'https://randomuser.me/api/portraits/men/2.jpg',
      'last_message': 'Sure, see you there!',
      'last_message_attachment_url': '',
      'last_message_time': DateTime(2025, 4, 10, 9, 30).toIso8601String(),
      'unread_message_count': 1,
      'is_online': false,
      'isTeam': true,
    },
    {
      'name': 'Diana Prince',
      'profile_picture': 'https://randomuser.me/api/portraits/women/4.jpg',
      'last_message': 'Happy birthday!',
      'last_message_attachment_url': '',
      'last_message_time': DateTime(2025, 4, 4, 9, 30).toIso8601String(),
      'unread_message_count': 0,
      'is_online': false,
      'isTeam': false,
    },
    {
      'name': 'Scheduling & Maintenance Team from the ABC company',
      'profile_picture': 'https://randomuser.me/api/portraits/men/2.jpg',
      'last_message': 'Sure, see you there!',
      'last_message_attachment_url': '',
      'last_message_time': DateTime(2025, 3, 1, 9, 30).toIso8601String(),
      'unread_message_count': 1565,
      'is_online': false,
      'isTeam': true,
    },
  ];

  for (int i = userData.length; i < 20; i++) {
    userData.add({
      'name': 'User $i',
      'profile_picture':
          'https://randomuser.me/api/portraits/men/${i % 100}.jpg',
      'last_message': 'This is the last message from User $i',
      'last_message_attachment_url':
          'https://randomuser.me/api/portraits/men/${i % 50}.jpg',
      'last_message_time': DateTime(2024, 2, 20, 8).toIso8601String(),
      'unread_message_count': i % 5,
      'is_online': i % 2 == 0,
      'isTeam': false,
    });
  }

  return userData
      .map(
        (e) => ChatModel(
          name: e['name'],
          profilePicture: e['profile_picture'],
          lastMessage: e['last_message'],
          lastMessageAttachmentUrl: e['last_message_attachment_url'],
          lastMessageTime: DateTime.parse(e['last_message_time']),
          unreadMessageCount: e['unread_message_count'],
          isOnline: e['is_online'],
          isTeam: e['isTeam'],
        ),
      )
      .toList();
}
