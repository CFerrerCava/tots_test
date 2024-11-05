import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tots_test/ui/styles/app_images.dart';
import 'package:tots_test/ui/styles/font.dart';
import 'package:tots_test/ui/styles/theme.dart';
import 'package:tots_test/ui/views/login/login_viewmodel.dart';
import 'package:tots_test/ui/widgets/custom_text_form_field_widget.dart';
import 'package:tots_test/ui/widgets/custom_tots_button_widget.dart';
import 'package:tots_test/util/input_validator.dart';
import 'package:tots_test/util/string_extension.dart';

import 'login_form_widget.form.dart';

@FormView(fields: [
  FormTextField(
    name: 'loginEmail',
    validator: InputValidator.validateEmail,
  ),
  FormTextField(
    name: 'loginPassword',
    validator: InputValidator.validatePassword,
  ),
])
class LoginFormWidget extends ViewModelWidget<LoginViewModel>
    with $LoginFormWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) => AbsorbPointer(
        absorbing: viewModel.loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 35, top: 70),
                  child: $graphics.minimal,
                ),
                const SizedBox(height: 58.88),
                Text(lang.loginSubTitle,
                    style: $font.bold.copyWith(
                        color: $theme.black0D1111,
                        fontSize: 12,
                        letterSpacing: 2.4)),
                const SizedBox(height: 34),
                CustomTextFormFieldWidget.normal(
                  hintText: lang.mailPlaceholder,
                  color: $theme.black161B14,
                  controller: loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                CustomTextFormFieldWidget.normal(
                  hintText: lang.passwordPlaceholder,
                  color: $theme.black161B14,
                  controller: loginPasswordController,
                  suffixIcon: IconButton(
                    icon: AnimatedCrossFade(
                        firstChild: $graphics.visibility,
                        firstCurve: Curves.decelerate,
                        secondChild: const Icon(Icons.visibility_off),
                        crossFadeState: viewModel.obscureText
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 250)),
                    onPressed: viewModel.onHidden,
                  ),
                  obscureText: viewModel.obscureText,
                ),
                const SizedBox(height: 52),
                CustomTotsButtonWidget(
                  text: viewModel.buttonText,
                  onPressed: viewModel.onPressed,
                ),
              ],
            ),
          ),
        ),
      );
}
