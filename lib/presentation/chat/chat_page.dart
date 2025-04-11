import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/presentation/chat/data/chat_sample_data.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/chat_list_app_bar.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/chat_list_tile.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/chat_shimmer.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/search_text_field.dart';
import 'package:flutter_skeleton/routes.gr.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatListAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.M),
        child: Column(
          children: [
            const SearchTextField(),
            const SizedBox(height: AppSize.XL),
            Expanded(
              child: FutureBuilder(
                future: Future.delayed(const Duration(seconds: 2)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const ChatMessages();
                  } else {
                    return const ShimmerLoadingView();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerLoadingView extends StatelessWidget {
  const ShimmerLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSize.M),
          child: ChatShimmer(),
        );
      },
    );
  }
}

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<ChatModel> sampleData = generateSampleUsersChat();
    return ListView.builder(
      itemCount: sampleData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.router
                .push(ChatConversationRoute(chatUser: sampleData[index]));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.M),
            child: ChatListTile(chatModel: sampleData[index]),
          ),
        );
      },
    );
  }
}
