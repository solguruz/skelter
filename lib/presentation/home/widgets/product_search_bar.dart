import 'package:avatar_glow/avatar_glow.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_event.dart';
import 'package:flutter_skeleton/presentation/home/bloc/home_state.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:permission_handler/permission_handler.dart';

class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({super.key});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  final TextEditingController searchController = TextEditingController();
  final debouncer =
      Debouncer<String>(const Duration(milliseconds: 500), initialValue: '');

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      debouncer.value = searchController.text;
    });
    debouncer.values.listen((debouncedText) {
      final trimmedText = debouncedText.trim();
      if (trimmedText.isEmpty) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
      context.read<HomeBloc>().add(
            FilterProductsEvent(searchQuery: trimmedText),
          );
    });
  }

  @override
  void dispose() {
    debouncer.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAnimatingListenIcon = context.select<HomeBloc, bool>(
      (bloc) => bloc.state.shouldAnimateListenIcon,
    );

    final searchQuery = context.select<HomeBloc, String>(
      (bloc) => bloc.state.searchQuery,
    );

    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, state) {
        if (state is MicrophoneVoiceInputtedState) {
          searchController.text = state.searchQuery;
        }
      },
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: context.localization.search,
          prefixIcon: const Icon(
            TablerIcons.search,
            color: AppColors.strokeNeutralDisabled,
          ),
          suffixIcon: searchQuery.isEmpty
              ? AvatarGlow(
                  animate: isAnimatingListenIcon,
                  glowColor: isAnimatingListenIcon
                      ? AppColors.strokeNeutralDisabled
                      : AppColors.white,
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
                          : AppColors.strokeNeutralDisabled,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () => searchController.clear(),
                  icon: const Icon(
                    TablerIcons.x,
                    color: AppColors.strokeNeutralDisabled,
                  ),
                ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Future<void> _onMicrophoneButtonPressed({
    required bool isAnimatingListenIcon,
  }) async {
    final permissionStatus = await Permission.microphone.request();
    if (permissionStatus.isPermanentlyDenied) {
      context.showSnackBar(
        context.localization.microphone_permission_permanently_denied,
      );
      return;
    }
    isAnimatingListenIcon
        ? context.read<HomeBloc>().add(const StopSpeechToTextEvent())
        : context.read<HomeBloc>().add(const StartSpeechToTextEvent());
  }
}
