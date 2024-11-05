import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/ui/widgets/background_bubble_widget.dart';
import 'package:tots_test/ui/widgets/login/login_form_widget.dart';
import 'package:tots_test/ui/widgets/login/login_form_widget.form.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> with $LoginFormWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: true,
      body: const KeyboardDismissOnTap(
        child: Stack(
          children: [
            BackgroundBubbleWidget.forLogin(),
            LoginFormWidget(),
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
