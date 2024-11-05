import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tots_test/ui/styles/app_images.dart';
import 'package:tots_test/ui/styles/theme.dart';
import 'package:tots_test/ui/views/home/home_viewmodel.dart';
import 'package:tots_test/ui/widgets/custom_text_form_field_widget.dart';
import 'package:tots_test/ui/widgets/custom_tots_button_widget.dart';
import 'package:tots_test/ui/widgets/home/client_form_search_widget.form.dart';
import 'package:tots_test/util/string_extension.dart';

@FormView(fields: [
  FormTextField(name: 'formSearch'),
])
class ClientFormSearchWidget extends ViewModelWidget<HomeViewModel>
    with $ClientFormSearchWidget {
  const ClientFormSearchWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: CustomTextFormFieldWidget.outline(
              hintText: lang.searchPlaceHolder,
              color: $theme.black000000,
              controller: formSearchController,
              prefixIcon: $graphics.carbonSearch,
              onChanged: viewModel.onSearch,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 2,
            child: CustomTotsButtonWidget(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
              fontSize: 13,
              text: lang.addNew,
              onPressed: viewModel.addNewClient,
            ),
          ),
        ],
      );
}
