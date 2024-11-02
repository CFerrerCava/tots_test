import 'package:hive/hive.dart';
import 'package:tots_test/models/auth_model_response.dart';

class HiveService {
  static const String _authBoxName = 'authBox';

  Future<Box<dynamic>> getCurrentBox() async =>
      await Hive.openBox<dynamic>(_authBoxName);

  Future<void> saveAuthModel(AuthModelResponse authModel) async {
    final box = await getCurrentBox();
    await box.put('auth', authModel);
    await box.close();
  }

  Future<AuthModelResponse?> getAuthModel() async {
    try {
      final box = await getCurrentBox();
      final authModel = box.get('auth');
      await box.close();
      return authModel as AuthModelResponse;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteAuthModel() async {
    final box = await getCurrentBox();
    await box.delete('auth');
    await box.close();
  }
}
