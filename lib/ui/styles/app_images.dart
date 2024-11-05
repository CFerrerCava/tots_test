import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tots_test/util/extension_path_enum.dart';

AppImages get $graphics => AppImages();

class AppImages {
  final String imageAssetName = 'assets/images/';
  final String iconsAssetName = 'assets/icons/';

  Widget get minimal =>
      Image.asset('${imageAssetName}minimal${ExtensionPath.png.path}');

  Widget get dash =>
      Image.asset('${imageAssetName}dash${ExtensionPath.jpg.path}');

  Widget get uploadImage =>
      Image.asset('${imageAssetName}upload_image${ExtensionPath.png.path}');

  Widget get dotsVertical => SvgPicture.asset(
      '${iconsAssetName}bi_three-dots-vertical${ExtensionPath.svg.path}',
      semanticsLabel: 'bi_three-dots-vertical');

  Widget get carbonSearch => SvgPicture.asset(
      '${iconsAssetName}carbon_search${ExtensionPath.svg.path}',
      semanticsLabel: 'carbon_search');

  Widget get editting =>
      SvgPicture.asset('${iconsAssetName}create${ExtensionPath.svg.path}',
          semanticsLabel: 'create');

  Widget get rightIcon =>
      SvgPicture.asset('${iconsAssetName}right_icon${ExtensionPath.svg.path}',
          semanticsLabel: 'right_icon');

  Widget get visibility => SvgPicture.asset(
        '${iconsAssetName}visibility${ExtensionPath.svg.path}',
        semanticsLabel: 'visibility',
        height: 25,
      );

  Widget vectorBubble({Size? size, required String bubble}) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: SvgPicture.asset(
          '$iconsAssetName$bubble${ExtensionPath.svg.path}',
          semanticsLabel: bubble,
          width: size?.width,
          height: size?.height,
        ),
      );

  Widget get overlay => SvgPicture.asset(
        '${iconsAssetName}overlay${ExtensionPath.svg.path}',
        semanticsLabel: 'overlay',
        width: 100,
        height: 100,
      );
}
