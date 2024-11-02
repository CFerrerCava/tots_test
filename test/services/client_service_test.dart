import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:tots_test/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ClientServiceTest -', () {
    setUp(() async {
      await initApp();
      registerServices();
    });
    tearDown(() async {
      locator.reset();
      await tearDownTestHive();
    });
  });
}
