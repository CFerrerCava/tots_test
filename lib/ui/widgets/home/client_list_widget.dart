import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/views/home/home_viewmodel.dart';
import 'package:tots_test/ui/widgets/home/client_item_widget.dart';

class ClientListWidget extends ViewModelWidget<HomeViewModel> {
  const ClientListWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) =>
      ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (_, index) => ClientItemWidget(
          client: viewModel.clientsShowed[index],
          onEdit: () => viewModel.onEdit(viewModel.clientsShowed[index]),
          onDelete: () => viewModel.onDelete(viewModel.clientsShowed[index]),
        ),
        separatorBuilder: (_, index) => const SizedBox(height: 16),
        itemCount: viewModel.clientsShowed.length,
      );
}
