import 'package:stacked/stacked.dart';
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
import 'package:tots_test/services/hive_service.dart';
import 'package:tots_test/services/s3_aws_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: HomeView, transitionsBuilder: TransitionsBuilders.zoomIn),
    MaterialRoute(page: StartupView),
    CustomRoute(
        page: LoginView, transitionsBuilder: TransitionsBuilders.fadeIn),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ClientService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: HiveService),
    LazySingleton(classType: FirebaseService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: AbmClientDialog),
    // @stacked-dialog
  ],
)
class App {}
