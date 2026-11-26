import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.chatModel,
    this.profileImageSize = 44.0,
    this.showStatus = true,
  });

  final ChatModel chatModel;
  final double profileImageSize;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(profileImageSize / 2),
          child: isFromTestEnvironment || chatModel.profilePicture.isEmpty
              ? SvgPicture.asset(
                  Assets.icons.userPlaceholder,
                  height: profileImageSize,
                  width: profileImageSize,
                  fit: .cover,
                )
              : CachedNetworkImage(
                  imageUrl: chatModel.profilePicture,
                  height: profileImageSize,
                  width: profileImageSize,
                  errorWidget: (context, url, error) => SvgPicture.asset(
                    Assets.icons.userPlaceholder,
                    height: profileImageSize,
                    width: profileImageSize,
                    fit: .cover,
                  ),
                ),
        ),
        if (chatModel.isOnline && showStatus)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: context.currentTheme.bgSuccessDefault,
                shape: .circle,
                border: Border.all(
                  color: context.currentTheme.strokeShadesWhite,
                  width: 1.5,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class ChatAvatarSmall extends StatelessWidget {
  const ChatAvatarSmall({super.key, required this.chatModel});

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return UserAvatar(
      chatModel: chatModel,
      profileImageSize: 40,
      showStatus: false,
    );
  }
}
