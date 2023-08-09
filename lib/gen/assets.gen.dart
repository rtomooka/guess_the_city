/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifGen {
  const $AssetsGifGen();

  /// File path: assets/gif/splash.gif
  AssetGenImage get splash => const AssetGenImage('assets/gif/splash.gif');

  /// List of all assets
  List<AssetGenImage> get values => [splash];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/introduction_1.png
  AssetGenImage get introduction1 =>
      const AssetGenImage('assets/image/introduction_1.png');

  /// File path: assets/image/introduction_2.png
  AssetGenImage get introduction2 =>
      const AssetGenImage('assets/image/introduction_2.png');

  /// File path: assets/image/introduction_3.png
  AssetGenImage get introduction3 =>
      const AssetGenImage('assets/image/introduction_3.png');

  /// File path: assets/image/introduction_4.png
  AssetGenImage get introduction4 =>
      const AssetGenImage('assets/image/introduction_4.png');

  /// File path: assets/image/japan_color.png
  AssetGenImage get japanColor =>
      const AssetGenImage('assets/image/japan_color.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [introduction1, introduction2, introduction3, introduction4, japanColor];
}

class $AssetsMapsGen {
  const $AssetsMapsGen();

  /// File path: assets/maps/Japan_template_large.svg
  String get japanTemplateLarge => 'assets/maps/Japan_template_large.svg';

  /// File path: assets/maps/sample.drawio.svg
  String get sampleDrawio => 'assets/maps/sample.drawio.svg';

  /// File path: assets/maps/shizuoka19.svg
  String get shizuoka19 => 'assets/maps/shizuoka19.svg';

  /// List of all assets
  List<String> get values => [japanTemplateLarge, sampleDrawio, shizuoka19];
}

class Assets {
  Assets._();

  static const $AssetsGifGen gif = $AssetsGifGen();
  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsMapsGen maps = $AssetsMapsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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
