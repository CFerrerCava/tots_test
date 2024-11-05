import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/dialogs/info_alert/info_alert_dialog_model.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';
import 'package:tots_test/ui/widgets/custom_tots_button_widget.dart';
import 'package:tots_test/util/string_extension.dart';

class ActionsDialogWidget extends ViewModelWidget<AbmClienteDialogModel> {
  const ActionsDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, AbmClienteDialogModel viewModel) => Row(
        children: [
          Flexible(
            flex: 3,
            child: MaterialButton(
              onPressed: viewModel.cancel,
              child: Text(
                lang.cancelButton,
                style: $font.medium.copyWith(color: $theme.gray08081661),
              ),
            ),
          ),
          Flexible(
              flex: 5,
              child: CustomTotsButtonWidget(
                text: viewModel.buttonText,
                onPressed: viewModel.saveOrEdit,
              ))
        ],
      );
}
