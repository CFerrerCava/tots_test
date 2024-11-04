import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/models/get_clients_response.dart';
import 'package:tots_test/services/api_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  ApiService getService() => ApiService();

  group('ApiServiceTest -', () {
    setUp(() async {
      await initApp();
      registerServices();
    });
    tearDown(() async {
      await tearDownTestHive();
      locator.reset();
    });

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

    group('When app needs list of clients ', () {
      test('Successful case', () async {
        final service = getService();
        var result = await service.getClients();
        result = result as GetClientsResponse;
        expect(result, isNotNull);
        expect(result.data, isList);
      });

      test('Badest case', () async {
        final service = getService();
        when(service.getClients()).thenAnswer((_) => Future.value(Exception));
        try {
          var result = await service.getClients();
          expect(result, isException);
        } catch (e) {
          expect(e.runtimeType, isException);
        }
      });
    });

    group('When app need create client', () {
      test('Sucessful case', () async {
        final service = getService();
        var result = await service.createClient(clientsModelRequest);
        expect(result, isNotNull);
        expect(result['id'], isNotEmpty);
      });
      test('Badest case', () async {
        final service = getService();
        when(service.createClient(clientsModelBadRequest))
            .thenAnswer((_) => Future.value(Exception));
        try {
          var result = await service.createClient(clientsModelBadRequest);
          expect(result, isException);
        } catch (e) {
          expect(e.runtimeType, isException);
        }
      });
    });

    group('Update client', () {
      test('Sucessful case', () async {
        final service = getService();
        var result = await service.updateClient(clientUpdateRequest);
        expect(result, isNotNull);
        expect(result['success'], isTrue);
      });
      test('Badest case', () async {
        final service = getService();
        when(service.updateClient(clientUpdateBadRequest))
            .thenAnswer((_) => Future.value(Exception));
        try {
          var result = await service.createClient(clientUpdateBadRequest);
          expect(result, isException);
        } catch (e) {
          expect(e.runtimeType, isException);
        }
      });
    });

    group('Get client', () {
      test('Sucessful case', () async {
        final service = getService();
        var result = await service.getClient(clientGetRequest.id!);
        expect(result, isNotNull);
        expect(result.id, isNonZero);
      });
      test('Badest case', () async {
        final service = getService();
        when(service.getClient(-1)).thenAnswer((_) => Future.value(Exception));
        try {
          var result = await service.getClient(-1);
          expect(result, isException);
        } catch (e) {
          expect(e.runtimeType, isException);
        }
      });
    });

    group('Delete client', () {
      test('Sucessful case', () async {
        final service = getService();
        var result = await service.deleteClient(clientUpdateRequest.id!);
        expect(result, isNotNull);
        expect(result['success'], isTrue);
      });
      test('Badest case', () async {
        final service = getService();
        when(service.deleteClient(-1))
            .thenAnswer((_) => Future.value(Exception));
        try {
          var result = await service.deleteClient(-1);
          expect(result, isException);
        } catch (e) {
          expect(e.runtimeType, isException);
        }
      });
    });
  });
}
