import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:sizer/sizer.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    const double profileImageSize = 14.0;
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
        if (chatModel.isOnline)
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
