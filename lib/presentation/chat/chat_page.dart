import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/presentation/chat/data/chat_sample_data.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/chat_app_bar.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/chat_list_tile.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/search_text_field.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatModel> sampleData = generateSampleUsersChat();
    return Scaffold(
      appBar: const ChatAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.M),
        child: Column(
          children: [
            const SearchTextField(),
            const SizedBox(height: AppSize.XL),
            Expanded(
              child: ListView.builder(
                itemCount: sampleData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSize.M),
                    child: ChatListTile(
                      chatModel: sampleData[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
