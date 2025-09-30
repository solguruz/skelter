import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/ssl_pinning/widgets/ssl_connection_failed_button.dart';
import 'package:skelter/presentation/ssl_pinning/widgets/ssl_connection_failed_icon.dart';
import 'package:skelter/presentation/ssl_pinning/widgets/ssl_connection_failed_message.dart';
import 'package:skelter/presentation/ssl_pinning/widgets/ssl_connection_failed_title.dart';

@RoutePage()
class SslConnectionFailedScreen extends StatelessWidget {
  const SslConnectionFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Spacer(),
              SslFailedIcon(),
              SizedBox(height: 24),
              SslFailedTitle(),
              SizedBox(height: 16),
              SslFailedMessage(),
              Spacer(),
              SslFailedButton(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
