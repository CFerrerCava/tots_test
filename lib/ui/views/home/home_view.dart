import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/widgets/background_bubble_widget.dart';
import 'package:tots_test/ui/widgets/home/home_body_widget.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
        body: SafeArea(
      child: KeyboardDismissOnTap(
        child: Stack(
          children: [
            BackgroundBubbleWidget.forHome(),
            HomeBodyWidget(),
          ],
        ),
      ),
    ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
