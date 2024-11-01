import 'package:tots_test/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tots_test/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tots_test/ui/views/home/home_view.dart';
import 'package:tots_test/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/ui/views/login/login_view.dart';
import 'package:tots_test/services/client_service.dart';
import 'package:tots_test/services/authentication_service.dart';
import 'package:tots_test/services/api_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ClientService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
