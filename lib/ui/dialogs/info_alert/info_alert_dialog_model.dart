import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/client_model.dart';
import 'package:tots_test/services/client_service.dart';
import 'package:tots_test/services/s3_aws_service.dart';
import 'package:tots_test/ui/dialogs/info_alert/info_alert_dialog.form.dart';
import 'package:tots_test/util/item_state.dart';
import 'package:tots_test/util/string_extension.dart';

class AbmClienteDialogModel extends FormViewModel {
  final _clientService = locator<ClientService>();
  final _firebaseService = locator<FirebaseService>();
  final _dialogService = locator<DialogService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [_clientService];

  @override
  void dispose() {
    _clientService.clientSelectedValue.value = null;
    clearForm();
    super.dispose();
  }

  String get firstName => hasAbmFirstName ? abmFirstNameValue! : '';

  String get lastName => hasAbmLastName ? abmLastNameValue! : '';

  String get emailAddress =>
      hasAbmEmailAddress && !hasAbmEmailAddressValidationMessage
          ? abmEmailAddressValue!
          : '';

  bool get clientAmbLoading => _clientService.clientAmbLoadingValue.value;

  bool isImageUpload = false;

  ItemState get clientState => _clientService.clientStateValue.value;

  String get buttonText {
    if (clientAmbLoading) return lang.loading;
    return lang.saveButton;
  }

  set serIsImageUpload(bool upload) {
    isImageUpload = upload;
    notifyListeners();
  }

  ClientsModel newClient = ClientsModel();

  void cancel({bool confirmed = false}) {
    _dialogService.completeDialog(DialogResponse(confirmed: confirmed));
  }

  void saveOrEdit() {
    if (lastName.isEmpty ||
        firstName.isEmpty ||
        emailAddress.isEmpty ||
        (newClient.photo == null)) {
      DialogService().showDialog(description: lang.loginMessageDataError);
      return;
    }
    newClient.lastname = lastName;
    newClient.firstname = firstName;
    newClient.email = emailAddress;
    if (clientState == ItemState.create) {
      _clientService.createClient(newClient).then(_onValidate);
    }
    if (clientState == ItemState.edit) {
      _clientService.updateClient(newClient).then(_onValidate);
    }
  }

  Future<void> uploadImage() async {
    serIsImageUpload = true;
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _firebaseService.uploadFile(image).then((onValue) {
          newClient.photo = onValue;
          serIsImageUpload = false;
        }).catchError((onError) {
          DialogService().showDialog(description: '$onError');
        });
      } else {
        serIsImageUpload = false;
      }
    } catch (e) {
      serIsImageUpload = false;
      DialogService().showDialog(description: '$e');
    }
  }

  FutureOr _onValidate(onValue) {
    if (onValue is! Exception) {
      DialogService()
          .showDialog(
              description: clientState == ItemState.create
                  ? lang.registed
                  : lang.updated)
          .then((_) {
        cancel(confirmed: true);
      });
    }
  }

  void updateForm() {
    if (clientState == ItemState.edit) {
      newClient = _clientService.clientSelectedValue.value!;
      notifyListeners();
      abmFirstNameValue = newClient.firstname;
      abmLastNameValue = newClient.lastname;
      abmEmailAddressValue = newClient.email;
      notifyListeners();
    }
  }
}
