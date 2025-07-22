import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/presentation/chat/enum/message_type_enum.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_message_model.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/image_full_screen_view.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MessageTypes extends StatelessWidget {
  const MessageTypes({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    switch (message.messageType) {
      case MessageType.text:
        return Text(
          message.message,
          style: AppTextStyles.p3Regular.withColor(
            message.isSentByMe ? AppColors.white : AppColors.neutral900,
          ),
        );

      case MessageType.image:
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () => _navigateToFullScreenImageView(context),
            child: SizedBox(
              width: 160,
              child: AspectRatio(
                aspectRatio: 1.9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  child: Hero(
                    tag: kHereAnimationPrefix,
                    child: CachedNetworkImage(
                      imageUrl: message.message,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

      case MessageType.audio:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const RotatedBox(
              quarterTurns: 45,
              child: Icon(
                TablerIcons.triangle_filled,
                color: AppColors.brand500,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              Assets.icons.waveforms,
              colorFilter:
                  const ColorFilter.mode(AppColors.brand500, BlendMode.srcIn),
            ),
          ],
        );
    }
  }

  void _navigateToFullScreenImageView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ImageFullScreenView(
            imagePathLists: [message.message],
          );
        },
      ),
    );
  }
}
