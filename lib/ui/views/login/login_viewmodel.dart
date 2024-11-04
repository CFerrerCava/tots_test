import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/auth_model_request.dart';
import 'package:tots_test/services/authentication_service.dart';
import 'package:tots_test/ui/views/login/login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_authenticationService];

  String get loginEmailText => hasLoginEmail ? loginEmailValue! : '';

  String get loginPasswordText => hasLoginPassword ? loginPasswordValue! : '';

  void onPressed() {
    final request = AuthRequest(
      email: loginEmailText,
      password: loginPasswordText,
    );

    _authenticationService.authenticate(request).onError(onError);
  }

  FutureOr onError(Object error, StackTrace stackTrace) {
    print(error);
  }
}
