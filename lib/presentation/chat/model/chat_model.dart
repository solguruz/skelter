class ChatModel {
  String name;
  String profilePicture;
  String lastMessage;
  String? lastMessageAttachmentUrl;
  DateTime? lastMessageTime;
  int? unreadMessageCount;
  bool isOnline;
  bool? isTeam;

  ChatModel({
    required this.name,
    required this.profilePicture,
    required this.lastMessage,
    this.lastMessageAttachmentUrl,
    this.lastMessageTime,
    this.unreadMessageCount,
    required this.isOnline,
    this.isTeam,
  });
}
