import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AiChatInputField extends StatefulWidget {
  const AiChatInputField({
    required this.onSend,
    required this.onStop,
    this.isEnabled = true,
    super.key,
  });

  final ValueChanged<String> onSend;
  final VoidCallback onStop;
  final bool isEnabled;

  @override
  State<AiChatInputField> createState() => _AiChatInputFieldState();
}

class _AiChatInputFieldState extends State<AiChatInputField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty || !widget.isEnabled) return;
    HapticFeedback.lightImpact();
    widget.onSend(text);
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12 + context.bottomPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF181B25).withOpacity(0.04),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                enabled: widget.isEnabled,
                style: AppTextStyles.p3Medium.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
                decoration: InputDecoration(
                  hintText: context.localization.ai_chat_ask_me_anything,
                  hintStyle: AppTextStyles.p3Medium.copyWith(
                    color: context.currentTheme.textNeutralDisable,
                  ),
                  counterText: '',
                  fillColor: context.currentTheme.bgSurfaceBase2,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.currentTheme.strokeNeutralLight200,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.currentTheme.strokeNeutralLight200,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.currentTheme.strokeNeutralLight200,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.currentTheme.strokeNeutralLight200,
                    ),
                  ),
                ),
                textInputAction: .send,
                onSubmitted: (_) => _handleSend(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: !widget.isEnabled
                ? _StopButton(
                    key: const ValueKey('stop'),
                    onTap: () {
                      HapticFeedback.lightImpact();
                      widget.onStop();
                    },
                  )
                : ValueListenableBuilder<TextEditingValue>(
                    key: const ValueKey('send'),
                    valueListenable: _controller,
                    builder: (context, value, _) {
                      final canSend = value.text.trim().isNotEmpty;
                      return _SendButton(
                        canSend: canSend,
                        onTap: canSend ? _handleSend : null,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({required this.canSend, required this.onTap});

  final bool canSend;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        Assets.icons.send,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          canSend
              ? context.currentTheme.bgBrandDefault
              : context.currentTheme.bgBrandDisabled,
          .srcIn,
        ),
      ),
    );
  }
}

class _StopButton extends StatelessWidget {
  const _StopButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: context.currentTheme.bgErrorDefault,
          shape: .circle,
        ),
        child: Icon(
          TablerIcons.player_stop_filled,
          size: 18,
          color: context.currentTheme.textNeutralLight,
        ),
      ),
    );
  }
}
