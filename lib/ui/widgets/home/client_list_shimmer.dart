import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tots_test/ui/styles/theme.dart';

class ClientListShimmer extends StatelessWidget {
  const ClientListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (_, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: $theme.grayC4C4C4,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 17,
                    width: 150,
                    decoration: BoxDecoration(
                        color: $theme.grayC4C4C4,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                const SizedBox(height: 5),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 12,
                    width: 200,
                    decoration: BoxDecoration(
                        color: $theme.grayC4C4C4,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      separatorBuilder: (_, index) => const SizedBox(height: 5),
      itemCount: 5,
    );
  }
}
