import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/ai_chat/bloc/ai_chat_event.dart';
import 'package:skelter/presentation/ai_chat/bloc/ai_chat_state.dart';
import 'package:skelter/presentation/ai_chat/model/ai_chat_message.dart';
import 'package:skelter/presentation/checkout/model/product_cart.dart';
import 'package:skelter/presentation/home/domain/entities/product.dart';
import 'package:skelter/services/ai/gemini_constants.dart';
import 'package:skelter/services/ai/gemini_service.dart';

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  AiChatBloc({
    required this._geminiService,
    required this._localizations,
    required this._products,
    required this._cartItems,
  }) : super(const AiChatState.initial()) {
    _setupEventListeners();
  }

  final GeminiService _geminiService;
  final AppLocalizations _localizations;
  final List<Product> _products;
  final List<CartModel> _cartItems;
  StreamSubscription<String>? _streamSubscription;
  GeminiChatSession? _chatSession;

  List<Product> get products => _products;

  void _setupEventListeners() {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<StreamResponseChunkEvent>(_onStreamResponseChunkEvent);
    on<StreamResponseCompleteEvent>(_onStreamResponseCompleteEvent);
    on<StreamResponseErrorEvent>(_onStreamResponseErrorEvent);
    on<StopGenerationEvent>(_onStopGenerationEvent);
    on<ClearChatEvent>(_onClearChatEvent);
  }

  GeminiChatSession _getOrCreateSession() {
    if (_chatSession != null) return _chatSession!;
    final systemInstruction =
        '${GeminiConstants.aiChatSystemInstruction}\n\n${_buildAppContext()}';
    _chatSession = _geminiService.createChatSession(systemInstruction);
    return _chatSession!;
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<AiChatState> emit,
  ) async {
    if (state.isGenerating) return;

    final userMessage = AiChatMessage(
      role: AiChatRole.user,
      content: event.message,
      timestamp: DateTime.now(),
    );

    final assistantMessage = AiChatMessage(
      role: AiChatRole.assistant,
      content: '',
      timestamp: DateTime.now(),
      isStreaming: true,
    );

    emit(
      state.copyWith(
        messages: [...state.messages, userMessage, assistantMessage],
        isGenerating: true,
        errorMessage: null,
      ),
    );

    try {
      final session = _getOrCreateSession();
      await _streamSubscription?.cancel();
      _streamSubscription = session
          .sendMessage(event.message)
          .listen(
            (chunk) => add(StreamResponseChunkEvent(chunk: chunk)),
            onDone: () => add(const StreamResponseCompleteEvent()),
            onError: (error) =>
                add(StreamResponseErrorEvent(errorMessage: error.toString())),
          );
    } catch (e) {
      add(StreamResponseErrorEvent(errorMessage: e.toString()));
    }
  }

  void _onStreamResponseChunkEvent(
    StreamResponseChunkEvent event,
    Emitter<AiChatState> emit,
  ) {
    if (state.messages.isEmpty) return;

    final updatedMessages = List<AiChatMessage>.from(state.messages);
    final lastMessage = updatedMessages.last;

    updatedMessages[updatedMessages.length - 1] = lastMessage.copyWith(
      content: lastMessage.content + event.chunk,
    );

    emit(state.copyWith(messages: updatedMessages));
  }

  void _onStreamResponseCompleteEvent(
    StreamResponseCompleteEvent event,
    Emitter<AiChatState> emit,
  ) {
    if (state.messages.isEmpty) return;

    final updatedMessages = List<AiChatMessage>.from(state.messages);
    final lastMessage = updatedMessages.last;

    if (lastMessage.content.trim().isEmpty) {
      updatedMessages.removeLast();
      emit(
        state.copyWith(
          messages: updatedMessages,
          isGenerating: false,
          errorMessage: _localizations.ai_chat_error_no_response,
        ),
      );
      return;
    }

    updatedMessages[updatedMessages.length - 1] = lastMessage.copyWith(
      isStreaming: false,
    );

    emit(state.copyWith(messages: updatedMessages, isGenerating: false));
  }

  void _onStreamResponseErrorEvent(
    StreamResponseErrorEvent event,
    Emitter<AiChatState> emit,
  ) {
    final userFriendlyMessage = _parseErrorMessage(event.errorMessage);

    if (state.messages.isNotEmpty) {
      final updatedMessages = List<AiChatMessage>.from(state.messages);
      updatedMessages.removeLast();
      emit(
        state.copyWith(
          messages: updatedMessages,
          isGenerating: false,
          errorMessage: userFriendlyMessage,
        ),
      );
    } else {
      emit(
        state.copyWith(isGenerating: false, errorMessage: userFriendlyMessage),
      );
    }
  }

  String _parseErrorMessage(String error) {
    final lowerError = error.toLowerCase();
    if (lowerError.contains('quota') || lowerError.contains('429')) {
      return _localizations.ai_chat_error_quota;
    }
    if (lowerError.contains('timeout')) {
      return _localizations.ai_chat_error_timeout;
    }
    if (lowerError.contains('network') ||
        lowerError.contains('socket') ||
        lowerError.contains('connection')) {
      return _localizations.ai_chat_error_network;
    }
    return _localizations.ai_chat_error_generic;
  }

  void _onStopGenerationEvent(
    StopGenerationEvent event,
    Emitter<AiChatState> emit,
  ) {
    _streamSubscription?.cancel();
    _streamSubscription = null;

    if (state.messages.isEmpty) return;

    final updatedMessages = List<AiChatMessage>.from(state.messages);
    final lastMessage = updatedMessages.last;

    if (!lastMessage.isUser) {
      if (lastMessage.content.trim().isEmpty) {
        updatedMessages.removeLast();
      } else {
        updatedMessages[updatedMessages.length - 1] = lastMessage.copyWith(
          isStreaming: false,
        );
      }
    }

    emit(state.copyWith(messages: updatedMessages, isGenerating: false));
  }

  void _onClearChatEvent(ClearChatEvent event, Emitter<AiChatState> emit) {
    _streamSubscription?.cancel();
    _chatSession = null;
    emit(const AiChatState.initial());
  }

  String _buildProductCatalog() {
    if (_products.isEmpty) return 'No products available currently.';

    final buffer = StringBuffer();
    for (final product in _products) {
      buffer.writeln(
        '- [id: ${product.id}] ${product.title} '
        '| \$${product.price.toStringAsFixed(2)} '
        '| Category: ${product.category} '
        '| Rating: ${product.rating}/5 (${product.reviews} reviews) '
        '| In Stock: ${product.availableQuantities} '
        '| Seller: ${product.seller}',
      );
    }
    return buffer.toString();
  }

  String _buildCartSummary() {
    if (_cartItems.isEmpty) return 'Cart is empty.';

    final buffer = StringBuffer();
    var total = 0.0;
    for (final item in _cartItems) {
      final itemTotal = item.product.price * item.quantities;
      total += itemTotal;
      buffer.writeln(
        '- ${item.product.title} x${item.quantities} '
        '= \$${itemTotal.toStringAsFixed(2)} '
        '(Delivery: ${item.expectedDeliveryDate})',
      );
    }
    buffer.writeln('Total: \$${total.toStringAsFixed(2)}');
    return buffer.toString();
  }

  String _buildAppContext() {
    return '''
=== PRODUCT CATALOG ===
${_buildProductCatalog()}

=== USER'S CART ===
${_buildCartSummary()}

=== SHIPPING INFO ===
- Customer Name: Roz Cooper
- Shipping Address: 2118 Thornridge Cir. Syracuse, Connecticut 35624
- Expected Delivery: $expectedDeliveryDate

=== PAYMENT INFO ===
- Payment Method: $paymentMethodAxis (Online)
- Discount Applied: \$25.90
- Delivery Charges: \$10.00

=== COUPONS ===
- Available Coupons: 1
- Coupon Code: FREEDELIVERY
- Coupon Offer: Get 10% off on orders above \$200

=== APP FEATURES ===
- Home: Browse products, search, voice search
- Search: Find products by name or category
- Cart: View cart items, adjust quantities, proceed to checkout
- Checkout Steps: Cart → Shipping → Payment → Order Review
- Profile: View/edit profile, settings, order history
- Wishlist: Save favorite products
- Notifications: Order updates, promotions
- Settings: Theme (light/dark), change password, biometric auth
- Contact Us: Submit queries with attachments
- Feedback: Submit bug reports, suggestions, compliments''';
  }
}
