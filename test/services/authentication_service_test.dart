import 'package:flutter_test/flutter_test.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/services/authentication_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AuthenticationServiceTest -', () {
    AuthenticationService getService() => AuthenticationService();
    setUp(() async {
      await initApp();
      registerServices();
    });
    tearDown(() => locator.reset());

    group('When use wants to aunthenticate', () {
      test('Succesful case', () async {
        final service = getService();
        await service.authenticate(authRequest);
        expect(service.authLoginValue, isNotNull);
      });

      test('Bad case', () async {
        final service = getService();
        await service.authenticate(authBadRequest);
        expect(service.authLoginValue.value, isNull);
      });
    });
  });
}
