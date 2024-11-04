import 'package:flutter/widgets.dart';

TotsFont get $font => TotsFont();

class TotsFont {
  final String fontFamily = 'DMSans';

  // Black
  TextStyle get black => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w900,
      );

  TextStyle get blackItalic => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      );

  // Bold
  TextStyle get bold => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
      );

  TextStyle get boldItalic => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      );

  // Extra Bold
  TextStyle get extraBold => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800,
      );

  TextStyle get extraBoldItalic => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
      );

  // Extra Light
  TextStyle get extraLight => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w200,
      );

  TextStyle get extraLightItalic => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w200,
        fontStyle: FontStyle.italic,
      );

  // Italic (Regular)
  TextStyle get italic => TextStyle(
        fontFamily: fontFamily,
        fontStyle: FontStyle.italic,
      );

  // Light
  TextStyle get light => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w300,
      );

  TextStyle get lightItalic => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
      );

  // Medium
  TextStyle get medium => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
      );

  TextStyle get mediumItalic => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  // Regular
  TextStyle get regular => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
      );

  // SemiBold
  TextStyle get semiBold => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
      );

  TextStyle get semiBoldItalic => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );

  // Thin
  TextStyle get thin => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w100,
      );

  TextStyle get thinItalic => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.italic,
      );
}
