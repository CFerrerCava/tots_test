import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tots_test/util/extension_path_enum.dart';

AppImages get $images => AppImages();

class AppImages {
  final String imageAssetName = 'assets/images/';
  final String iconsAssetName = 'assets/icons/';

  Widget get minimal =>
      Image.asset('${imageAssetName}minimal${ExtensionPath.png.path}');

  Widget get uploadImage =>
      SvgPicture.asset('${iconsAssetName}upload_image${ExtensionPath.svg.path}',
          semanticsLabel: 'upload logo');

  Widget get dotsVertical => SvgPicture.asset(
      '${iconsAssetName}bi_three-dots-vertical${ExtensionPath.svg.path}',
      semanticsLabel: 'bi_three-dots-vertical');

  Widget get carbonSearch => SvgPicture.asset(
      '${iconsAssetName}carbon_search${ExtensionPath.svg.path}',
      semanticsLabel: 'carbon_search');

  Widget get create =>
      SvgPicture.asset('${iconsAssetName}create${ExtensionPath.svg.path}',
          semanticsLabel: 'create');

  Widget get rightIcon =>
      SvgPicture.asset('${iconsAssetName}right_icon${ExtensionPath.svg.path}',
          semanticsLabel: 'upload logo');
}
