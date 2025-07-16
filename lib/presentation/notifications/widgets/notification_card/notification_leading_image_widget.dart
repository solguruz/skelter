import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/utils/app_environment.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class NotificationLeadingImageWidget extends StatelessWidget {
  const NotificationLeadingImageWidget({
    super.key,
    required this.notificationModel,
  });

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;

    return isFromTestEnvironment
        ? const FlutterLogo(size: 88)
        : CachedNetworkImage(
            imageUrl: notificationModel.image,
            height: 88,
            width: 88,
            progressIndicatorBuilder: (context, url, progress) {
              return const Center(child: CircularProgressIndicator());
            },
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: AppColors.errorColor,
            ),
            imageBuilder: (context, imageProvider) {
              return InkWell(
                onTap: () {
                  context.pushRoute(
                    NetworkImageRoute(
                      link: notificationModel.image,
                    ),
                  );
                },
                child: Hero(
                  tag: notificationModel.image,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
