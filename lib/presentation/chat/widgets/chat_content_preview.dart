import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:sizer/sizer.dart';

class ChatContentPreview extends StatelessWidget {
  const ChatContentPreview({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            chatModel.name,
            style: AppTextStyles.p2Medium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              if (chatModel.lastMessageAttachmentUrl != null &&
                  chatModel.lastMessageAttachmentUrl!.isNotEmpty)
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: chatModel.lastMessageAttachmentUrl ?? '',
                        height: 4.w,
                        width: 4.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              Expanded(
                child: Text(
                  chatModel.lastMessage,
                  style: AppTextStyles.p3Regular,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
