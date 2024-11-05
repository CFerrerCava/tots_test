import 'package:flutter/material.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';

class DotItemWidget extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;
  final String title;
  const DotItemWidget(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: $theme.black000000,
      ),
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          IconButton(onPressed: onPressed, icon: icon),
          const SizedBox(width: 6),
          Text(
            title,
            style: $font.regular.copyWith(
              color: $theme.whiteFFFFFF,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
