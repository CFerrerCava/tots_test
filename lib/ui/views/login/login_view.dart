import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tots_test/util/string_extension.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'loginEmail'),
  FormTextField(name: 'loginPassword'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          children: [
            Text(lang.minimalTitle),
            const SizedBox(height: 58.88),
            Text(lang.loginSubTitle),
            const SizedBox(height: 34),
            TextFormField(controller: loginEmailController),
            const SizedBox(height: 24),
            TextFormField(controller: loginPasswordController),
            const SizedBox(height: 52),
            MaterialButton(onPressed: viewModel.onPressed)
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
