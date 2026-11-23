import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_bloc.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_event.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_state.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class NewMessageTextField extends StatefulWidget {
  const NewMessageTextField({super.key});

  @override
  State<NewMessageTextField> createState() => _NewMessageTextFieldState();
}

class _NewMessageTextFieldState extends State<NewMessageTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    context.read<ChatConversationBloc>().add(
      ChatConversationDraftChangedEvent(draft: _controller.text),
    );
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final bloc = context.read<ChatConversationBloc>();
    if (bloc.state.isSending) return;
    bloc.add(ChatConversationSendMessageEvent(text: text));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.currentTheme.strokeNeutralLight200),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                style: AppTextStyles.p3Medium.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: context.localization.send_a_new_message,
                  hintStyle: AppTextStyles.p3Medium.copyWith(
                    color: context.currentTheme.textNeutralDisable,
                  ),
                  errorStyle: AppTextStyles.p3Regular,
                  errorMaxLines: 2,
                  counterText: '',
                  border: _buildBorder(context),
                  enabledBorder: _buildBorder(context),
                  focusedBorder: _buildBorder(context),
                  errorBorder: _buildBorder(context, isError: true),
                ),
                textInputAction: .send,
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
            const SizedBox(width: 8),
            BlocBuilder<ChatConversationBloc, ChatConversationState>(
              buildWhen: (previous, current) =>
                  previous.canSend != current.canSend,
              builder: (context, state) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: state.canSend ? _sendMessage : null,
                  icon: SvgPicture.asset(
                    Assets.icons.send,
                    colorFilter: ColorFilter.mode(
                      state.canSend
                          ? context.currentTheme.bgBrandHover
                          : context.currentTheme.iconNeutralDisabled,
                      .srcIn,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder(
    BuildContext context, {
    bool isError = false,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isError
            ? context.currentTheme.strokeErrorDefault
            : context.currentTheme.strokeNeutralLight200,
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }
}
