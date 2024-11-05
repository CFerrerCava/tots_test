import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tots_test/ui/styles/theme.dart';

class AvatarPhotoWidget extends StatelessWidget {
  final String url;
  final bool isLoading;
  const AvatarPhotoWidget(
      {super.key, required this.url, this.isLoading = false});

  double get radius => 60;

  Widget get placeholder => Center(
          child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              color: $theme.grayC4C4C4,
              borderRadius: BorderRadius.circular(100)),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? placeholder
        : ClipOval(
            child: CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => Container(
                width: radius * 2,
                height: radius * 2,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: placeholder,
              ),
              errorWidget: (context, url, error) => Container(
                width: radius * 2,
                height: radius * 2,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: const Icon(Icons.error, color: Colors.red),
              ),
              width: radius * 2,
              height: radius * 2,
              fit: BoxFit.cover,
            ),
          );
  }
}
