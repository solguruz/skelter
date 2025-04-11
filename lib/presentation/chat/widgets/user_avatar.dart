import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:sizer/sizer.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.chatModel,
    this.profileImageSize = 14.0,
    this.showStatus = true,
  });

  final ChatModel chatModel;
  final double profileImageSize;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular((profileImageSize / 2).w),
          child: CachedNetworkImage(
            imageUrl: chatModel.profilePicture,
            height: profileImageSize.w,
            width: profileImageSize.w,
          ),
        ),
        if (chatModel.isOnline && showStatus)
          Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgSuccessDefault,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                ),
              ),
              padding: const EdgeInsets.all(6),
            ),
          ),
      ],
    );
  }
}

class ChatAvatarSmall extends StatelessWidget {
  const ChatAvatarSmall({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return UserAvatar(
      chatModel: chatModel,
      profileImageSize: 10,
      showStatus: false,
    );
  }
}
