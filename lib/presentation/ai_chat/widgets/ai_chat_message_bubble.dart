import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/ai_chat/model/ai_chat_message.dart';
import 'package:skelter/presentation/ai_chat/widgets/ai_chat_product_card.dart';
import 'package:skelter/presentation/home/domain/entities/product.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AiChatMessageBubble extends StatelessWidget {
  const AiChatMessageBubble({
    super.key,
    required this.message,
    required this.products,
    required this.onCartTap,
  });

  final AiChatMessage message;
  final List<Product> products;
  final VoidCallback onCartTap;

  static final RegExp _productMarkerRegex = RegExp(r'\[PRODUCT:([^\]]+)\]');
  static final RegExp _cartMarkerRegex = RegExp(r'\[CART\]');
  static final RegExp _allMarkersRegex = RegExp(r'\[PRODUCT:[^\]]+\]|\[CART\]');

  String _formatTimestamp(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  List<Product> _extractProducts(String content) {
    final matches = _productMarkerRegex.allMatches(content);
    final result = <Product>[];
    final seenIds = <String>{};
    for (final match in matches) {
      final id = match.group(1);
      if (id == null || !seenIds.add(id)) continue;
      final product = products.where((p) => p.id == id).firstOrNull;
      if (product != null) result.add(product);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return message.isUser
        ? _buildUserMessage(context)
        : _buildAssistantMessage(context);
  }

  Widget _buildUserMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 60, right: 16),
      child: Column(
        crossAxisAlignment: .end,
        mainAxisSize: .min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: context.currentTheme.bgBrandDefault,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: context.currentTheme.bgBrandDefault.withOpacity(0.22),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              message.content,
              style: AppTextStyles.p3Regular.copyWith(
                color: context.currentTheme.textNeutralLight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 2),
            child: Text(
              _formatTimestamp(message.timestamp),
              style: AppTextStyles.c2Regular.copyWith(
                color: context.currentTheme.textNeutralSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssistantMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 60),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: context.currentTheme.bgBrandLight50,
              shape: .circle,
            ),
            child: Icon(
              TablerIcons.robot,
              size: 14,
              color: context.currentTheme.iconBrandPrimary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: context.currentTheme.bgBrandLight50,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: (message.isStreaming && message.content.isEmpty)
                        ? SizedBox(
                            key: const ValueKey('typing'),
                            child: _buildTypingIndicator(context),
                          )
                        : SizedBox(
                            key: const ValueKey('content'),
                            child: _buildAssistantContent(context),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 2),
                  child: Text(
                    _formatTimestamp(message.timestamp),
                    style: AppTextStyles.c2Regular.copyWith(
                      color: context.currentTheme.textNeutralSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// One blank line after the intro sentence,
  /// no blank lines between list items.
  String _normalizeSpacing(String text) {
    final firstBreak = text.indexOf('\n');
    if (firstBreak == -1) return text;
    final intro = text.substring(0, firstBreak);
    final body = text.substring(firstBreak + 1).replaceAll('\n\n', '\n').trim();
    return '$intro\n\n$body';
  }

  Widget _buildAssistantContent(BuildContext context) {
    final textOnly = _normalizeSpacing(
      message.content.replaceAll(_allMarkersRegex, '').trim(),
    );
    final referencedProducts = _extractProducts(message.content);
    final hasCartMarker = _cartMarkerRegex.hasMatch(message.content);

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        if (textOnly.isNotEmpty)
          Text(
            textOnly,
            style: AppTextStyles.p3Regular.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
          ),
        for (final product in referencedProducts)
          AiChatProductCard(product: product),
        if (hasCartMarker) _buildCartButton(context),
      ],
    );
  }

  Widget _buildCartButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: onCartTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: context.currentTheme.bgBrandDefault,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: .min,
            children: [
              Icon(
                TablerIcons.shopping_cart,
                size: 16,
                color: context.currentTheme.textNeutralLight,
              ),
              const SizedBox(width: 6),
              Text(
                context.localization.ai_chat_view_cart,
                style: AppTextStyles.p4SemiBold.copyWith(
                  color: context.currentTheme.textNeutralLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: List.generate(3, (index) {
        return _TypingDot(
          delay: Duration(milliseconds: index * 200),
          color: context.currentTheme.textNeutralSecondary,
        );
      }),
    );
  }
}

class _TypingDot extends StatefulWidget {
  const _TypingDot({required this.delay, required this.color});

  final Duration delay;
  final Color color;

  @override
  State<_TypingDot> createState() => _TypingDotState();
}

class _TypingDotState extends State<_TypingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(
      begin: 0,
      end: -6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    Future.delayed(widget.delay, () {
      if (mounted) _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _animation.value),
        child: child,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 8,
        height: 8,
        decoration: BoxDecoration(color: widget.color, shape: .circle),
      ),
    );
  }
}
