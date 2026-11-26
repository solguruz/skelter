import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_event.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_state.dart';
import 'package:skelter/presentation/chat/constants/chat_constants.dart';
import 'package:skelter/presentation/chat/domain/entities/chat_text_message_entity.dart';
import 'package:skelter/presentation/chat/domain/usecases/send_chat_message.dart';
import 'package:skelter/presentation/chat/domain/usecases/watch_chat_messages.dart';

class ChatConversationBloc
    extends Bloc<ChatConversationEvent, ChatConversationState> {
  ChatConversationBloc({
    required this._watchChatMessages,
    required this._sendChatMessage,
    required String currentUserId,
    required String recipientUserId,
  }) : _currentUserId = currentUserId,
       _recipientUserId = recipientUserId,
       _chatId = buildChatId(currentUserId, recipientUserId),
       super(const ChatConversationState.initial()) {
    on<ChatConversationSubscribedEvent>(_onChatConversationSubscribedEvent);
    on<ChatConversationMessagesReceivedEvent>(
      _onChatConversationMessagesReceivedEvent,
    );
    on<ChatConversationMessagesFailedEvent>(
      _onChatConversationMessagesFailedEvent,
    );
    on<ChatConversationDraftChangedEvent>(_onChatConversationDraftChangedEvent);
    on<ChatConversationSendMessageEvent>(_onChatConversationSendMessageEvent);
  }

  final WatchChatMessages _watchChatMessages;
  final SendChatMessage _sendChatMessage;
  final String _currentUserId;
  final String _recipientUserId;
  final String _chatId;

  String get currentUserId => _currentUserId;

  StreamSubscription<List<ChatTextMessageEntity>>? _subscription;

  Future<void> _onChatConversationSubscribedEvent(
    ChatConversationSubscribedEvent event,
    Emitter<ChatConversationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ChatConversationStatus.loading,
        errorMessage: null,
      ),
    );
    await _subscription?.cancel();
    _subscription = _watchChatMessages(chatId: _chatId).listen(
      (messages) =>
          add(ChatConversationMessagesReceivedEvent(messages: messages)),
      onError: (Object error) =>
          add(ChatConversationMessagesFailedEvent(message: error.toString())),
    );
  }

  void _onChatConversationMessagesReceivedEvent(
    ChatConversationMessagesReceivedEvent event,
    Emitter<ChatConversationState> emit,
  ) {
    emit(
      state.copyWith(
        status: ChatConversationStatus.loaded,
        messages: event.messages,
      ),
    );
  }

  void _onChatConversationMessagesFailedEvent(
    ChatConversationMessagesFailedEvent event,
    Emitter<ChatConversationState> emit,
  ) {
    emit(
      state.copyWith(
        status: ChatConversationStatus.failure,
        errorMessage: event.message,
      ),
    );
  }

  void _onChatConversationDraftChangedEvent(
    ChatConversationDraftChangedEvent event,
    Emitter<ChatConversationState> emit,
  ) {
    emit(state.copyWith(draft: event.draft));
  }

  Future<void> _onChatConversationSendMessageEvent(
    ChatConversationSendMessageEvent event,
    Emitter<ChatConversationState> emit,
  ) async {
    final text = event.text.trim();
    if (text.isEmpty || state.isSending) return;
    emit(state.copyWith(isSending: true));
    final result = await _sendChatMessage(
      SendChatMessageParams(
        senderId: _currentUserId,
        recipientId: _recipientUserId,
        text: text,
      ),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isSending: false, errorMessage: failure.message)),
      (_) => emit(state.copyWith(isSending: false, draft: '')),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
