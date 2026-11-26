import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/presentation/notifications/model/notification_model.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

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
              return Shimmer.fromColors(
                baseColor: context.currentTheme.bgNeutralLight100,
                highlightColor: context.currentTheme.bgNeutralLight100
                    .withOpacity(0.6),
                child: Container(
                  height: 88,
                  width: 88,
                  decoration: BoxDecoration(
                    color: context.currentTheme.bgNeutralLight100,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: AppColors.errorColor),
            imageBuilder: (context, imageProvider) {
              return InkWell(
                onTap: () {
                  context.pushRoute(
                    NetworkImageRoute(link: notificationModel.image),
                  );
                },
                child: Hero(
                  tag: notificationModel.image,
                  child: Container(
                    clipBehavior: .hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(image: imageProvider, fit: .cover),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
