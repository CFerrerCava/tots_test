import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tots_test/app/app.locator.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('HiveServiceTest -', () {
    MockHiveService getService() => MockHiveService();
    setUp(() async {
      await initApp();
      registerServices();
    });
    tearDown(() async {
      await tearDownTestHive();
      locator.reset();
    });

    group('App needs to use hive correctly', () {
      test('Sucessful save auth info', () async {
        final service = getService();
        await service.saveAuthModel(authModelResponse);

        // Verify put was called with correct parameters
        verify(await service.saveAuthModel(authModelResponse)).called(1);
      });

      test('deleteAuthModel removes the AuthModelResponse from the box',
          () async {
        final service = getService();

        await service.deleteAuthModel();

        // Verify delete was called on the box
        verify(service.deleteAuthModel()).called(1);
      });
    });
  });
}
