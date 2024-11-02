import 'package:flutter_test/flutter_test.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/models/get_clients_response.dart';
import 'package:tots_test/services/api_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  ApiService getService() => ApiService();
  group('ApiServiceTest -', () {
    setUp(() async {
      await initApp();
      registerServices();
    });
    tearDown(() => locator.reset());

    group('When user wants to aunthenticate', () {
      test('Succesful case', () async {
        final service = getService();
        var result = await service.authenticate(authRequest);
        result = result as AuthModelResponse;
        expect(result, isNotNull);
        expect(result.accessToken, isNotEmpty);
        expect(result.email, isNotEmpty);
        expect(result.id, isNonNegative);
        expect(result.tokenType, bearer);
      });

      test('Bad case', () async {
        final service = getService();
        final result = await service.authenticate(authBadRequest);
        expect(result, isNotNull);
        expect(result, isException);
      });
    });

    group('When app needs crud ', () {
      test('List of clients', () async {
        // todo add token
        final service = MockApiService();
        var result = await service.getClients();
        result = result as GetClientsResponse;
        expect(result, isNotNull);
        expect(result.data, isList);
      });
    });
  });
}
