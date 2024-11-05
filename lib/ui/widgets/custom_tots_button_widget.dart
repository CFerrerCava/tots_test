import 'package:flutter/material.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';

class CustomTotsButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double fontSize;
  final EdgeInsets? padding;
  const CustomTotsButtonWidget(
      {super.key,
      this.onPressed,
      required this.text,
      this.fontSize = 14,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      color: $theme.black0D1111,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: Text(
        text,
        style: $font.medium.copyWith(
            fontSize: fontSize, color: $theme.whiteFFFFFF, letterSpacing: 0.5),
      ),
    );
  }
}
