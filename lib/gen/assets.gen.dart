/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/icons/app_icon.png');

  /// File path: assets/icons/app_icon_no_bg.png
  AssetGenImage get appIconNoBg =>
      const AssetGenImage('assets/icons/app_icon_no_bg.png');

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/journal.svg
  String get journal => 'assets/icons/journal.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/settings.svg
  String get settings => 'assets/icons/settings.svg';

  /// File path: assets/icons/therapist.svg
  String get therapist => 'assets/icons/therapist.svg';

  /// List of all assets
  List<dynamic> get values => [
        appIcon,
        appIconNoBg,
        home,
        journal,
        profile,
        search,
        settings,
        therapist
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dash_img_1.png
  AssetGenImage get dashImg1 =>
      const AssetGenImage('assets/images/dash_img_1.png');

  /// File path: assets/images/dash_img_2.png
  AssetGenImage get dashImg2 =>
      const AssetGenImage('assets/images/dash_img_2.png');

  /// File path: assets/images/dash_img_3.png
  AssetGenImage get dashImg3 =>
      const AssetGenImage('assets/images/dash_img_3.png');

  /// File path: assets/images/dash_img_4.png
  AssetGenImage get dashImg4 =>
      const AssetGenImage('assets/images/dash_img_4.png');

  /// File path: assets/images/dash_img_5.png
  AssetGenImage get dashImg5 =>
      const AssetGenImage('assets/images/dash_img_5.png');

  /// File path: assets/images/welcome_bg.png
  AssetGenImage get welcomeBg =>
      const AssetGenImage('assets/images/welcome_bg.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [dashImg1, dashImg2, dashImg3, dashImg4, dashImg5, welcomeBg];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
