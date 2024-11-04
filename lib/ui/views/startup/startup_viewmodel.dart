import 'package:stacked/stacked.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/services/hive_service.dart';

class StartupViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _hiveService = locator<HiveService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [];
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    final auth = await _hiveService.getAuthModel();
    if (auth?.accessToken?.isNotEmpty ?? false) {
      _navigationService.replaceWithHomeView();
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
