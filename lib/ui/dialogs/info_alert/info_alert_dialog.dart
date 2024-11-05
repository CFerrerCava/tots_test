import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/ui/dialogs/info_alert/info_alert_dialog.form.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';
import 'package:tots_test/ui/widgets/custom_text_form_field_widget.dart';
import 'package:tots_test/ui/widgets/info_dialog/actions_dialog_widget.dart';
import 'package:tots_test/ui/widgets/info_dialog/avatar_upload_widget.dart';
import 'package:tots_test/util/input_validator.dart';
import 'package:tots_test/util/string_extension.dart';

import 'info_alert_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: 'abmFirstName'),
  FormTextField(name: 'abmLastName'),
  FormTextField(
      name: 'abmEmailAddress', validator: InputValidator.validateEmail),
])
class AbmClientDialog extends StackedView<AbmClienteDialogModel>
    with $AbmClientDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AbmClientDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbmClienteDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: $theme.whiteFFFFFF,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: AbsorbPointer(
          absorbing: viewModel.clientAmbLoading || viewModel.isImageUpload,
          child: KeyboardDismissOnTap(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    lang.addNewClientTitle,
                    style: $font.medium
                        .copyWith(color: $theme.black222222, fontSize: 17),
                  ),
                  const SizedBox(height: 48),
                  const AvatarUploadWidget(),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      CustomTextFormFieldWidget.normal(
                        hintText: lang.firstNamePlaceholder,
                        color: $theme.black22222295,
                        controller: abmFirstNameController,
                        underlineColor: $theme.grayE0E0E0,
                      ),
                      const SizedBox(height: 14),
                      CustomTextFormFieldWidget.normal(
                        hintText: lang.lastNamePlaceholder,
                        color: $theme.black22222295,
                        controller: abmLastNameController,
                        underlineColor: $theme.grayE0E0E0,
                      ),
                      const SizedBox(height: 14),
                      CustomTextFormFieldWidget.normal(
                        hintText: lang.emailAdressPlaceholder,
                        color: $theme.black22222295,
                        controller: abmEmailAddressController,
                        underlineColor: $theme.grayE0E0E0,
                        keyboardType: TextInputType.emailAddress,
                        validator: InputValidator.validateEmail,
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  const ActionsDialogWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AbmClienteDialogModel viewModelBuilder(BuildContext context) =>
      AbmClienteDialogModel();

  @override
  void onViewModelReady(AbmClienteDialogModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.updateForm();
  }
}
