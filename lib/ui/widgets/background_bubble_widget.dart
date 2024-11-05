import 'package:flutter/material.dart';
import 'package:tots_test/ui/styles/app_images.dart';
import 'package:tots_test/util/vector_enum.dart';

class BackgroundBubbleWidget extends StatelessWidget {
  final bool _forHome;
  const BackgroundBubbleWidget.forLogin({super.key}) : _forHome = false;
  const BackgroundBubbleWidget.forHome({super.key}) : _forHome = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_forHome) ...[
          Positioned(
            left: 30,
            top: 20,
            child: $graphics.vectorBubble(bubble: VectorEnum.bubblehome1.name),
          ),
          Positioned(
            right: -10,
            top: 200,
            child: $graphics.vectorBubble(bubble: VectorEnum.bubblehome2.name),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: $graphics.vectorBubble(bubble: VectorEnum.bubblehome4.name),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: $graphics.vectorBubble(bubble: VectorEnum.bubblehome3.name),
          ),
        ],
        if (!_forHome) ...[
          Positioned(
            right: 0,
            top: 0,
            child: $graphics.vectorBubble(bubble: VectorEnum.bubble1.name),
          ),
          Positioned(
            left: 0,
            top: MediaQuery.sizeOf(context).width * 0.5,
            child: $graphics.vectorBubble(bubble: VectorEnum.bubble2.name),
          ),
          Positioned(
            bottom: -35,
            left: 0,
            child: $graphics.vectorBubble(bubble: VectorEnum.bubble3.name),
          ),
        ],
        Positioned(
          bottom: -MediaQuery.sizeOf(context).width,
          left: -100,
          child: $graphics.vectorBubble(
              size: const Size(300.19, 305.46),
              bubble: VectorEnum.bubble3.name),
        ),
      ],
    );
  }
}
