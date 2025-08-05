// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/account_deleted_success.svg
  String get accountDeletedSuccess =>
      'assets/icons/account_deleted_success.svg';

  /// File path: assets/icons/app_under_maintenance.svg
  String get appUnderMaintenance => 'assets/icons/app_under_maintenance.svg';

  /// File path: assets/icons/apple.svg
  String get apple => 'assets/icons/apple.svg';

  /// File path: assets/icons/close.svg
  String get close => 'assets/icons/close.svg';

  /// File path: assets/icons/coupon.svg
  String get coupon => 'assets/icons/coupon.svg';

  /// File path: assets/icons/delivery_parcel.svg
  String get deliveryParcel => 'assets/icons/delivery_parcel.svg';

  /// File path: assets/icons/email.svg
  String get email => 'assets/icons/email.svg';

  /// File path: assets/icons/email_notification.svg
  String get emailNotification => 'assets/icons/email_notification.svg';

  /// File path: assets/icons/empty_cart.svg
  String get emptyCart => 'assets/icons/empty_cart.svg';

  /// File path: assets/icons/empty_saved_cards.svg
  String get emptySavedCards => 'assets/icons/empty_saved_cards.svg';

  /// File path: assets/icons/empty_wishlist.svg
  String get emptyWishlist => 'assets/icons/empty_wishlist.svg';

  /// File path: assets/icons/force_update.svg
  String get forceUpdate => 'assets/icons/force_update.svg';

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// File path: assets/icons/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icons/icon.png');

  /// File path: assets/icons/mdi_tick.svg
  String get mdiTick => 'assets/icons/mdi_tick.svg';

  /// File path: assets/icons/no_chats.svg
  String get noChats => 'assets/icons/no_chats.svg';

  /// File path: assets/icons/no_internet_connection.svg
  String get noInternetConnection => 'assets/icons/no_internet_connection.svg';

  /// File path: assets/icons/no_notifications.svg
  String get noNotifications => 'assets/icons/no_notifications.svg';

  /// File path: assets/icons/search_outline.svg
  String get searchOutline => 'assets/icons/search_outline.svg';

  /// File path: assets/icons/send.svg
  String get send => 'assets/icons/send.svg';

  /// File path: assets/icons/server_error.svg
  String get serverError => 'assets/icons/server_error.svg';

  /// File path: assets/icons/tick.svg
  String get tick => 'assets/icons/tick.svg';

  /// File path: assets/icons/user_not_found.svg
  String get userNotFound => 'assets/icons/user_not_found.svg';

  /// File path: assets/icons/user_placeholder.svg
  String get userPlaceholder => 'assets/icons/user_placeholder.svg';

  /// File path: assets/icons/waveforms.svg
  String get waveforms => 'assets/icons/waveforms.svg';

  /// List of all assets
  List<dynamic> get values => [
        accountDeletedSuccess,
        appUnderMaintenance,
        apple,
        close,
        coupon,
        deliveryParcel,
        email,
        emailNotification,
        emptyCart,
        emptySavedCards,
        emptyWishlist,
        forceUpdate,
        google,
        icon,
        mdiTick,
        noChats,
        noInternetConnection,
        noNotifications,
        searchOutline,
        send,
        serverError,
        tick,
        userNotFound,
        userPlaceholder,
        waveforms
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cart_item_1.png
  AssetGenImage get cartItem1 =>
      const AssetGenImage('assets/images/cart_item_1.png');

  /// File path: assets/images/cart_item_2.png
  AssetGenImage get cartItem2 =>
      const AssetGenImage('assets/images/cart_item_2.png');

  /// File path: assets/images/demo_user.jpeg
  AssetGenImage get demoUser =>
      const AssetGenImage('assets/images/demo_user.jpeg');

  /// File path: assets/images/mastercard.png
  AssetGenImage get mastercard =>
      const AssetGenImage('assets/images/mastercard.png');

  /// File path: assets/images/sg_skeleton_logo.png
  AssetGenImage get sgSkeletonLogo =>
      const AssetGenImage('assets/images/sg_skeleton_logo.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [cartItem1, cartItem2, demoUser, mastercard, sgSkeletonLogo];
}

class $AssetsTestGen {
  const $AssetsTestGen();

  /// Directory path: assets/test/files
  $AssetsTestFilesGen get files => const $AssetsTestFilesGen();

  /// Directory path: assets/test/images
  $AssetsTestImagesGen get images => const $AssetsTestImagesGen();
}

class $AssetsTestFilesGen {
  const $AssetsTestFilesGen();

  /// File path: assets/test/files/test_pdf.pdf
  String get testPdf => 'assets/test/files/test_pdf.pdf';

  /// List of all assets
  List<String> get values => [testPdf];
}

class $AssetsTestImagesGen {
  const $AssetsTestImagesGen();

  /// File path: assets/test/images/test_image.jpeg
  AssetGenImage get testImage =>
      const AssetGenImage('assets/test/images/test_image.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [testImage];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTestGen test = $AssetsTestGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
