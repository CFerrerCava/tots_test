import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/models/auth_model_request.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/models/client_model.dart';
import 'package:tots_test/models/get_clients_response.dart';
import 'package:tots_test/services/client_service.dart';
import 'package:tots_test/services/authentication_service.dart';
import 'package:tots_test/services/api_service.dart';
import 'package:tots_test/services/hive_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

part '../mock_json.dart';
part '../mock_objects.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ClientService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthenticationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<HiveService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterClientService();
  getAndRegisterAuthenticationService();
  getAndRegisterApiService();
  getAndRegisterHiveService();
// @stacked-mock-register
}

Future<void> initApp() async {
  dotenv.testLoad(fileInput: '''
        BASE_URL=https://myback-execute-dot-my-back-401316.uc.r.appspot.com/6-tots-test
      ''');

  await setUpTestHive();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(AuthModelResponseAdapter());
  }
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockClientService getAndRegisterClientService() {
  _removeRegistrationIfExists<ClientService>();
  final service = MockClientService();
  locator.registerSingleton<ClientService>(service);
  return service;
}

MockAuthenticationService getAndRegisterAuthenticationService() {
  _removeRegistrationIfExists<AuthenticationService>();
  final service = MockAuthenticationService();
  when(service.authLoginValue).thenReturn(ReactiveValue(authModelResponse));
  when(service.authenticate(authRequest))
      .thenAnswer((_) => Future.value(authModelResponse));

  when(service.authLoginValue).thenReturn(ReactiveValue(null));
  when(service.authenticate(any)).thenAnswer((_) => Future.value(null));
  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

MockApiService getAndRegisterApiService() {
  _removeRegistrationIfExists<ApiService>();
  final service = MockApiService();
  when(service.authenticate(authRequest))
      .thenAnswer((_) => Future.value(authModelResponse));

  when(service.authenticate(authBadRequest))
      .thenAnswer((_) => Future.value(authBadResponse));

  when(service.getClients()).thenAnswer((_) => Future.value(listOfClients));

  when(service.createClient(clientsModelRequest))
      .thenAnswer((_) => Future.value(mockCreateResponse));

  when(service.updateClient(clientUpdateRequest))
      .thenAnswer((_) => Future.value(mockCreateResponse));
  locator.registerSingleton<ApiService>(service);
  return service;
}

MockHiveService getAndRegisterHiveService() {
  _removeRegistrationIfExists<HiveService>();
  final service = MockHiveService();

  when(service.saveAuthModel(authModelResponse)).thenAnswer((_) async {});

  when(service.getAuthModel())
      .thenAnswer((_) => Future.value(authModelResponse));

  when(service.deleteAuthModel()).thenAnswer((_) async {});

  // when(service.saveAuthModel(authModelBadResponse)).thenAnswer((_) async {});

  // when(service.getAuthModel())
  //     .thenAnswer((_) => Future.value(authModelBadResponse));

  locator.registerSingleton<HiveService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
