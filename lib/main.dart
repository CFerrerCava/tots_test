import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tots_test/app/app.bottomsheets.dart';
import 'package:tots_test/app/app.dialogs.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/services/s3_aws_service.dart';
import 'package:tots_test/ui/styles/font.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AuthModelResponseAdapter());
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await dotenv.load();
  FirebaseService().initializeDefault();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
      theme: ThemeData(fontFamily: $font.fontFamily),
    );
  }
}
