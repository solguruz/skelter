import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

extension AppBuildContextExtensions on BuildContext {
  /// A convenience wrapper for [Navigator.push].
  /// If pushing a new route/page, prefer using [pushRoute] instead.
  /// 'For navigation, use auto_route and its `pushRoute` method instead'
  Future<T?> pushWidget<T extends Object?>(
    Widget page,
  ) =>
      Navigator.of(this).push(
        MaterialPageRoute(
          builder: (BuildContext context) => page,
        ),
      );

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  double get screenPaddingTop => screenPadding.top;

  double get screenPaddingBottom => screenPadding.bottom;

  double get screenPaddingLeft => screenPadding.left;

  double get screenPaddingRight => screenPadding.right;

  double get heightWithoutAppBarAndVerticalPadding {
    const double appBarHeight = kToolbarHeight;
    final double verticalPadding = screenPaddingTop + screenPaddingBottom;
    return screenHeight - appBarHeight - verticalPadding;
  }

  double get heightWithoutVerticalPadding {
    final double verticalPadding = screenPaddingTop + screenPaddingBottom;
    return screenHeight - verticalPadding;
  }
}

extension PushPage on BuildContext {
  /// Pushes a new route/page using auto_route.
  /// 'For navigation, use auto_route and its `pushRoute` method instead'
  Future pushMaterialPageRoute(Widget page) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }
}

extension ShowSnackbar on BuildContext {
  // void showSomethingWentWrongSnackBar() {
  //   showSnackBar(
  //     l10n.onboarding_somethingWentWrong,
  //     color: AppColors.snackBarErrorColor,
  //   );
  // }

  void showSnackBar(
    String message, {
    Color? color,
    bool isDisplayingError = false,
    int millis = 3000,
    Widget? leading,
    Widget? trailing,
    bool showCloseIcon = false,
    SnackBarAction? action,
    Duration? duration,
    bool showTrailingLoader = false,
  }) {
    hideSnackBar();
    final Text messageText = Text(
      message,
      style: const TextStyle(color: Colors.white),
    );
    List<Widget> contents;

    if (trailing != null) {
      contents = <Widget>[
        Expanded(child: messageText),
        const SizedBox(width: 10),
        trailing,
      ];
    } else if (leading != null) {
      contents = <Widget>[
        leading,
        const SizedBox(width: 10),
        Expanded(child: messageText),
      ];
    } else if (showTrailingLoader) {
      contents = <Widget>[
        Expanded(child: messageText),
        const SizedBox(width: 10),
        const SizedBox.square(
          dimension: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 2,
          ),
        ),
      ];
    } else if (showCloseIcon) {
      contents = [
        Expanded(child: messageText),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: hideSnackBar,
          child: AppIcon(Assets.icons.close, size: 18),
        ),
      ];
    } else {
      contents = <Widget>[Expanded(child: messageText)];
    }
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: color ??
            (isDisplayingError
                ? AppColors.snackBarErrorColor
                : AppColors.snackBarBGColor),
        content: Row(children: contents),
        duration: duration ?? Duration(milliseconds: millis),
        behavior: SnackBarBehavior.floating,
        action: action,
      ),
    );
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }

  /// Use this only when you need to show a [SnackBar] on a bottom sheet
  /// or on a [BottomNavigationBar].The standard [showSnackBar] method places
  /// the [SnackBar] beneath the bottom sheet, making it invisible.
  void showCustomSnackbar(
    String message, {
    int millis = 3000,
  }) {
    final overlay = Overlay.of(this);
    final overlayEntry = OverlayEntry(
      builder: (context) {
        final bottomOffset = MediaQuery.paddingOf(context).bottom;

        return Positioned(
          bottom: bottomOffset + 10,
          left: 16,
          right: 16,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.snackBarBGColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                message,
                style: AppTextStyles.p3Bold.withColor(AppColors.white),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(milliseconds: millis), () {
      overlayEntry.remove();
    });
  }
}

extension ShowBottomSheet on BuildContext {
  Future<void> showBottomSheet(Widget child) async {
    return showModalBottomSheet(
      context: this,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (BuildContext context) => child,
    );
  }
}

extension ShowLoader on BuildContext {
  void showLoader() {
    loaderOverlay.show();
  }

  void hideLoader() {
    loaderOverlay.hide();
  }
}
