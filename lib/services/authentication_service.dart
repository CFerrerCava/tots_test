import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/auth_model_request.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/services/api_service.dart';

@LazySingleton()
class AuthenticationService with ListenableServiceMixin {
  final _apiService = locator<ApiService>();

  final authLoadingValue = ReactiveValue<bool>(false);
  final authLoginValue = ReactiveValue<AuthModelResponse?>(null);

  AuthenticationService() {
    listenToReactiveValues([
      authLoginValue,
      authLoadingValue,
    ]);
  }

  set setAuthLoginValue(AuthModelResponse auth) => authLoginValue.value = auth;

  Future<dynamic> authenticate(AuthRequest request) {
    authLoadingValue.value = true;
    return _apiService.authenticate(request).then((authResponse) {
      if (authResponse is AuthModelResponse) {
        setAuthLoginValue = authResponse;
        return authResponse;
      } else {
        DialogService().showDialog(description: '$authResponse');
      }
    }).whenComplete(() => authLoadingValue.value = false);
  }
}
