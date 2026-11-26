import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/ai_chat/bloc/ai_chat_bloc.dart';
import 'package:skelter/presentation/ai_chat/widgets/ai_chat_bottom_sheet.dart';
import 'package:skelter/presentation/checkout/data/cart_sample_data.dart';
import 'package:skelter/presentation/home/bloc/home_bloc.dart';
import 'package:skelter/presentation/home/bloc/home_event.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AiChatFab extends StatefulWidget {
  const AiChatFab({super.key});

  @override
  State<AiChatFab> createState() => _AiChatFabState();
}

class _AiChatFabState extends State<AiChatFab> {
  AiChatBloc? _aiChatBloc;

  void _openChat() {
    final homeBloc = context.read<HomeBloc>();
    final products = homeBloc.state.topProducts;

    _aiChatBloc ??= AiChatBloc(
      geminiService: sl(),
      localizations: context.localization,
      products: products,
      cartItems: cartSampleData,
    );

    showAiChatBottomSheet(
      context,
      existingBloc: _aiChatBloc!,
      onCartTap: () {
        Navigator.of(context).pop();
        homeBloc.add(const BottomNavBarIndexChangedEvent(index: 2));
      },
    );
  }

  @override
  void dispose() {
    _aiChatBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _openChat,
      backgroundColor: context.currentTheme.bgBrandDefault,
      elevation: 4,
      child: Icon(
        TablerIcons.message_chatbot,
        color: context.currentTheme.textNeutralLight,
      ),
    );
  }
}
