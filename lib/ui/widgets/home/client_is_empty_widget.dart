import 'package:flutter/material.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';
import 'package:tots_test/util/string_extension.dart';

class ClientIsEmptyWidget extends StatefulWidget {
  const ClientIsEmptyWidget({super.key});

  @override
  State<ClientIsEmptyWidget> createState() => _ClientIsEmptyWidgetState();
}

class _ClientIsEmptyWidgetState extends State<ClientIsEmptyWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
      reverseDuration: const Duration(milliseconds: 2500),
    );
    animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    animationController.addListener(_listener);
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: SlideTransition(
        position: animation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.arrow_upward_sharp),
            Text(
              lang.listIsEmpty,
              style: $font.extraBold
                  .copyWith(fontSize: 25, color: $theme.black0D0D0D),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _listener() {
    setState(() {});
  }
}
