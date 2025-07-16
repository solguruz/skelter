import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

@RoutePage()
class NetworkImageScreen extends StatelessWidget {
  const NetworkImageScreen({super.key, required this.link});

  final String link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: Center(
        child: Hero(
          tag: link,
          child: CachedNetworkImage(
            imageUrl: link,
            progressIndicatorBuilder: (context, url, progress) {
              return const Center(child: CircularProgressIndicator());
            },
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.error,
                color: AppColors.errorColor,
              ),
            ),
            imageBuilder: (context, imageProvider) {
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
