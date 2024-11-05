import 'package:flutter/material.dart';
import 'package:tots_test/ui/styles/app_images.dart';
import 'package:tots_test/util/vector_enum.dart';

class BackgroundBubbleWidget extends StatelessWidget {
  const BackgroundBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
