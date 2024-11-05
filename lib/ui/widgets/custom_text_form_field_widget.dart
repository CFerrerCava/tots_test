import 'package:flutter/material.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final Color color;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final double fontSize;
  final Color? underlineColor;
  final String? Function(String?)? validator;

  const CustomTextFormFieldWidget.normal({
    super.key,
    required this.hintText,
    required this.color,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixIcon,
    this.onChanged,
    this.keyboardType,
    this.fontSize = 16,
    this.underlineColor,
    this.validator,
  }) : _isOutline = false;

  const CustomTextFormFieldWidget.outline({
    super.key,
    required this.hintText,
    required this.color,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixIcon,
    this.onChanged,
    this.keyboardType,
    this.fontSize = 16,
    this.underlineColor,
    this.validator,
  }) : _isOutline = true;

  final bool _isOutline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon == null
              ? null
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: suffixIcon,
                ),
          prefixIcon: prefixIcon == null
              ? null
              : IconButton(
                  onPressed: () {},
                  icon: prefixIcon!,
                ),
          errorStyle: const TextStyle(color: Colors.red),
          focusedBorder: _isOutline
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: $theme.black0D0D0D),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: $theme.black0D0D0D)),
          border: _isOutline
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:
                      BorderSide(color: underlineColor ?? $theme.grayC4C4C4),
                )
              : UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: underlineColor ?? $theme.grayC4C4C4))),
      style: $font.regular.copyWith(color: color, fontSize: fontSize),
    );
  }
}
