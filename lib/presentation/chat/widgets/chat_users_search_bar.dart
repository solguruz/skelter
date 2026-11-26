import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_bloc.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_event.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_state.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/haptic_feedback_util.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ChatUsersSearchBar extends StatefulWidget {
  const ChatUsersSearchBar({super.key});

  @override
  State<ChatUsersSearchBar> createState() => _ChatUsersSearchBarState();
}

class _ChatUsersSearchBarState extends State<ChatUsersSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final _debouncer = Debouncer<String>(
    const Duration(milliseconds: 500),
    initialValue: '',
  );
  StreamSubscription<String>? _debouncerSubscription;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _debouncer.value = _searchController.text;
    });
    _debouncerSubscription = _debouncer.values.listen((debouncedText) {
      final trimmed = debouncedText.trim();
      if (trimmed.isEmpty) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
      if (!mounted) return;
      context.read<ChatUsersBloc>().add(
        ChatUsersFilterChangedEvent(searchQuery: trimmed),
      );
    });
  }

  @override
  void dispose() {
    _debouncerSubscription?.cancel();
    _debouncer.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAnimatingListenIcon = context.select<ChatUsersBloc, bool>(
      (bloc) => bloc.state.shouldAnimateListenIcon,
    );
    final searchQuery = context.select<ChatUsersBloc, String>(
      (bloc) => bloc.state.searchQuery,
    );

    return BlocListener<ChatUsersBloc, ChatUsersState>(
      listenWhen: (previous, current) =>
          previous.searchQuery != current.searchQuery,
      listener: (context, state) {
        if (_searchController.text != state.searchQuery) {
          _searchController.text = state.searchQuery;
        }
      },
      child: TextField(
        controller: _searchController,
        style: AppTextStyles.p3Medium.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
        decoration: InputDecoration(
          hintText: context.localization.search,
          hintStyle: AppTextStyles.p3Medium.copyWith(
            color: context.currentTheme.textNeutralDisable,
          ),
          filled: true,
          fillColor: context.currentTheme.bgSurfaceBase2,
          prefixIcon: Icon(
            TablerIcons.search,
            color: context.currentTheme.strokeNeutralDisabled,
          ),
          suffixIcon: searchQuery.isEmpty
              ? AvatarGlow(
                  animate: isAnimatingListenIcon,
                  glowColor: isAnimatingListenIcon
                      ? context.currentTheme.strokeNeutralDisabled
                      : context.currentTheme.bgShadesWhite,
                  child: IconButton(
                    onPressed: () => _onMicrophoneButtonPressed(
                      isAnimatingListenIcon: isAnimatingListenIcon,
                    ),
                    icon: Icon(
                      isAnimatingListenIcon
                          ? TablerIcons.square_filled
                          : TablerIcons.microphone,
                      color: isAnimatingListenIcon
                          ? AppColors.red
                          : context.currentTheme.strokeNeutralDisabled,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () => _searchController.clear(),
                  icon: Icon(
                    TablerIcons.x,
                    color: context.currentTheme.strokeNeutralDisabled,
                  ),
                ),
          border: _buildOutlineInputBorder(hasFocus: false),
          enabledBorder: _buildOutlineInputBorder(hasFocus: false),
          focusedBorder: _buildOutlineInputBorder(hasFocus: true),
          errorBorder: _buildOutlineInputBorder(isErrorBorder: true),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder({
    bool? hasFocus,
    bool? isErrorBorder,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isErrorBorder ?? false
            ? context.currentTheme.strokeErrorDefault
            : hasFocus ?? false
            ? context.currentTheme.strokeBrandHover
            : context.currentTheme.strokeNeutralLight200,
      ),
    );
  }

  Future<void> _onMicrophoneButtonPressed({
    required bool isAnimatingListenIcon,
  }) async {
    final permissionStatus = await Permission.microphone.request();
    if (!mounted) return;
    if (permissionStatus.isPermanentlyDenied) {
      context.showSnackBar(
        context.localization.microphone_permission_permanently_denied,
      );
      return;
    }
    await HapticFeedbackUtil.tap();
    if (!mounted) return;
    if (isAnimatingListenIcon) {
      context.read<ChatUsersBloc>().add(const ChatUsersStopSpeechToTextEvent());
    } else {
      context.read<ChatUsersBloc>().add(
        const ChatUsersStartSpeechToTextEvent(),
      );
    }
  }
}
