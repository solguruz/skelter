import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_event.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_state.dart';
import 'package:skelter/presentation/chat/domain/entities/chat_preview_entity.dart';
import 'package:skelter/presentation/chat/domain/entities/chat_user_entity.dart';
import 'package:skelter/presentation/chat/domain/usecases/watch_my_chats.dart';
import 'package:skelter/presentation/chat/domain/usecases/watch_other_users.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatUsersBloc extends Bloc<ChatUsersEvent, ChatUsersState> {
  ChatUsersBloc({
    required this._watchOtherUsers,
    required this._watchMyChats,
    required this._currentUserId,
  }) : super(const ChatUsersState.initial()) {
    on<ChatUsersSubscribedEvent>(_onChatUsersSubscribedEvent);
    on<ChatUsersReceivedEvent>(_onChatUsersReceivedEvent);
    on<ChatPreviewsReceivedEvent>(_onChatPreviewsReceivedEvent);
    on<ChatUsersFailedEvent>(_onChatUsersFailedEvent);
    on<ChatUsersFilterChangedEvent>(_onChatUsersFilterChangedEvent);
    on<ChatUsersToggleSpeechAnimationEvent>(
      _onChatUsersToggleSpeechAnimationEvent,
    );
    on<ChatUsersStartSpeechToTextEvent>(_onChatUsersStartSpeechToTextEvent);
    on<ChatUsersStopSpeechToTextEvent>(_onChatUsersStopSpeechToTextEvent);
    on<ChatUsersVoiceInputCompleteEvent>(_onChatUsersVoiceInputCompleteEvent);
  }

  final WatchOtherUsers _watchOtherUsers;
  final WatchMyChats _watchMyChats;
  final String _currentUserId;
  final SpeechToText _speech = SpeechToText();
  StreamSubscription<List<ChatUserEntity>>? _usersSubscription;
  StreamSubscription<List<ChatPreviewEntity>>? _previewsSubscription;

  Future<void> _onChatUsersSubscribedEvent(
    ChatUsersSubscribedEvent event,
    Emitter<ChatUsersState> emit,
  ) async {
    emit(state.copyWith(status: ChatUsersStatus.loading, errorMessage: null));
    await _usersSubscription?.cancel();
    await _previewsSubscription?.cancel();
    _usersSubscription = _watchOtherUsers(currentUserId: _currentUserId).listen(
      (users) => add(ChatUsersReceivedEvent(users: users)),
      onError: (Object error) =>
          add(ChatUsersFailedEvent(message: error.toString())),
    );
    _previewsSubscription = _watchMyChats(currentUserId: _currentUserId).listen(
      (previews) => add(ChatPreviewsReceivedEvent(previews: previews)),
      onError: (Object error) =>
          add(ChatUsersFailedEvent(message: error.toString())),
    );
  }

  void _onChatUsersReceivedEvent(
    ChatUsersReceivedEvent event,
    Emitter<ChatUsersState> emit,
  ) {
    emit(state.copyWith(status: ChatUsersStatus.loaded, users: event.users));
  }

  void _onChatPreviewsReceivedEvent(
    ChatPreviewsReceivedEvent event,
    Emitter<ChatUsersState> emit,
  ) {
    final byOtherUid = <String, ChatPreviewEntity>{
      for (final preview in event.previews) preview.otherUserId: preview,
    };
    emit(state.copyWith(chatPreviews: byOtherUid));
  }

  void _onChatUsersFailedEvent(
    ChatUsersFailedEvent event,
    Emitter<ChatUsersState> emit,
  ) {
    emit(
      state.copyWith(
        status: ChatUsersStatus.failure,
        errorMessage: event.message,
      ),
    );
  }

  void _onChatUsersFilterChangedEvent(
    ChatUsersFilterChangedEvent event,
    Emitter<ChatUsersState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.searchQuery));
  }

  void _onChatUsersToggleSpeechAnimationEvent(
    ChatUsersToggleSpeechAnimationEvent event,
    Emitter<ChatUsersState> emit,
  ) {
    emit(
      state.copyWith(shouldAnimateListenIcon: event.shouldAnimateListenIcon),
    );
  }

  Future<void> _onChatUsersStartSpeechToTextEvent(
    ChatUsersStartSpeechToTextEvent event,
    Emitter<ChatUsersState> emit,
  ) async {
    add(
      const ChatUsersToggleSpeechAnimationEvent(shouldAnimateListenIcon: true),
    );
    try {
      await _speech.initialize();
      await _speech.listen(
        listenOptions: SpeechListenOptions(
          cancelOnError: true,
          autoPunctuation: true,
          enableHapticFeedback: true,
        ),
        onResult: (result) {
          add(
            ChatUsersVoiceInputCompleteEvent(
              searchQuery: result.recognizedWords.trim(),
            ),
          );
        },
      );
    } catch (_) {
      add(
        const ChatUsersToggleSpeechAnimationEvent(
          shouldAnimateListenIcon: false,
        ),
      );
    }
  }

  void _onChatUsersStopSpeechToTextEvent(
    ChatUsersStopSpeechToTextEvent event,
    Emitter<ChatUsersState> emit,
  ) {
    if (_speech.isListening) {
      _speech.stop();
    }
    emit(state.copyWith(shouldAnimateListenIcon: false));
  }

  void _onChatUsersVoiceInputCompleteEvent(
    ChatUsersVoiceInputCompleteEvent event,
    Emitter<ChatUsersState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.searchQuery));
  }

  @override
  Future<void> close() {
    _usersSubscription?.cancel();
    _previewsSubscription?.cancel();
    _speech.stop();
    _speech.cancel();
    return super.close();
  }
}
