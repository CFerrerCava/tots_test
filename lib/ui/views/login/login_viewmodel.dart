import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/app/app.router.dart';
import 'package:tots_test/models/auth_model_request.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/services/authentication_service.dart';
import 'package:tots_test/ui/widgets/login/login_form_widget.form.dart';
import 'package:tots_test/util/string_extension.dart';

class LoginViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_authenticationService];

  String get loginEmailText =>
      hasLoginEmail && !hasLoginEmailValidationMessage ? loginEmailValue! : '';

  String get loginPasswordText => hasLoginPassword ? loginPasswordValue! : '';

  bool get loading => _authenticationService.authLoadingValue.value;

  bool obscureText = true;

  String get buttonText {
    if (loading) return lang.loading;
    return lang.loginSubTitle;
  }

  set _setObscureText(bool hidden) {
    obscureText = hidden;
    notifyListeners();
  }

  Future<void> onPressed() async {
    if (!hasLoginEmail || !hasLoginPassword) {
      String messageError = lang.loginMessageDataError;
      if (hasLoginEmail && !hasLoginPassword) {
        messageError = lang.loginPasswordError;
      }
      if (!hasLoginEmail && hasLoginPassword) {
        messageError = lang.loginEmailError;
      }
      await DialogService().showDialog(title: messageError);
      return;
    }
    final request = AuthRequest(
      email: loginEmailText,
      password: loginPasswordText,
    );

    _authenticationService.authenticate(request).then((onValue) {
      if (onValue is AuthModelResponse) {
        _navigationService.replaceWithHomeView();
      }
    });
  }

  void onHidden() {
    _setObscureText = !obscureText;
  }
}
