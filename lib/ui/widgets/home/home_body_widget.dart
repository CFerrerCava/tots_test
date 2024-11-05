import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/styles/app_images.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';
import 'package:tots_test/ui/views/home/home_viewmodel.dart';
import 'package:tots_test/ui/widgets/custom_tots_button_widget.dart';
import 'package:tots_test/ui/widgets/home/client_form_search_widget.dart';
import 'package:tots_test/ui/widgets/home/client_is_empty_widget.dart';
import 'package:tots_test/ui/widgets/home/client_list_shimmer.dart';
import 'package:tots_test/ui/widgets/home/client_list_widget.dart';
import 'package:tots_test/util/string_extension.dart';

class HomeBodyWidget extends ViewModelWidget<HomeViewModel> {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) => Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 32, left: 32, right: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: viewModel.logout, icon: const Icon(Icons.logout)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: SizedBox(width: 128.92, child: $graphics.minimal),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                lang.clientsLabel,
                style: $font.bold.copyWith(
                    color: $theme.black434545, fontSize: 20, letterSpacing: 1),
              ),
            ),
            const SizedBox(height: 24),
            const ClientFormSearchWidget(),
            const SizedBox(height: 24),
            Expanded(
              child: AnimatedCrossFade(
                  firstChild: const ClientListShimmer(),
                  secondChild: viewModel.listIsEmpty
                      ? const ClientIsEmptyWidget()
                      : const ClientListWidget(),
                  crossFadeState: viewModel.listCrossFadeState,
                  duration: const Duration(milliseconds: 250)),
            ),
            const SizedBox(height: 24),
            CustomTotsButtonWidget(
              fontSize: 14,
              padding: const EdgeInsets.symmetric(vertical: 14),
              text: lang.loadMoreButton.toUpperCase(),
              onPressed: viewModel.loadMore,
            )
          ],
        ),
      );
}
