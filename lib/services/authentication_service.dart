import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/auth_model_request.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/services/api_service.dart';

@LazySingleton()
class AuthenticationService with ListenableServiceMixin {
  final _apiService = locator<ApiService>();

  @Factory()
  AuthenticationService();

  final authLoadingValue = ReactiveValue(false);
  final authLoginValue = ReactiveValue<AuthModelResponse?>(null);

  @Factory()
  AuthenticationService.from() {
    listenToReactiveValues([
      authLoginValue,
      authLoadingValue,
    ]);
  }

  set setAuthLoginValue(auth) => authLoginValue.value = auth;

  Future<dynamic> authenticate(AuthRequest request) {
    authLoadingValue.value = false;
    return _apiService.authenticate(request).then((authResponse) {
      if (authResponse is Exception) {
        //call to simple modal
      } else {
        setAuthLoginValue = authResponse;
      }
    }).whenComplete(() => authLoadingValue.value = false);
  }
}
