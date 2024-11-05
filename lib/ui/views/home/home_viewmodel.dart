import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/app/app.dialogs.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/app/app.router.dart';
import 'package:tots_test/models/client_model.dart';
import 'package:tots_test/services/authentication_service.dart';
import 'package:tots_test/services/client_service.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/util/item_state.dart';
import 'package:tots_test/util/string_extension.dart';

class HomeViewModel extends FormViewModel {
  final _dialogService = locator<DialogService>();
  final _clientService = locator<ClientService>();
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_clientService, _authenticationService];

  bool get loading => _clientService.clientLoadingValue.value;

  List<ClientsModel> get _listOfClients =>
      _clientService.listOfClientsValue.value.reversed.toList();

  List<ClientsModel> clientsShowed = [];

  ClientsModel? get clientSelected => _clientService.clientSelectedValue.value;

  HomeViewModel() {
    _getClients();
  }

  CrossFadeState listCrossFadeState = CrossFadeState.showFirst;

  set setListCrossFadeState(CrossFadeState state) {
    listCrossFadeState = state;
    notifyListeners();
  }

  bool listIsEmpty = false;

  set setListIsEmpty(bool isEmpty) {
    listIsEmpty = isEmpty;
    notifyListeners();
  }

  int clientsPaggined = 0;
  int _currentPage = 0;
  static const _itemsPerPage = 5;

  void showDialog() {
    _dialogService.showCustomDialog(variant: DialogType.abmClient);
  }

  addNewClient() {
    _clientService.clientStateValue.value = ItemState.create;
    showDialog();
  }

  void _getClients() {
    setListCrossFadeState = CrossFadeState.showFirst;
    _clientService.getClients().then((_) {
      setListCrossFadeState = CrossFadeState.showSecond;
      if (_listOfClients.isNotEmpty) {
        _calculatePaggined();
      } else {
        setListIsEmpty = true;
      }
    });
  }

  loadMore() {
    _getClients();
  }

  void _calculatePaggined() {
    final start = _currentPage * _itemsPerPage;
    final end = start + _itemsPerPage;
    clientsPaggined = end > _listOfClients.length ? _listOfClients.length : end;
    clientsShowed = _listOfClients.sublist(0, clientsPaggined);
    _currentPage++;
    notifyListeners();
  }

  onSearch(String textSearched) {
    final tempList = clientsShowed = _listOfClients.sublist(0, clientsPaggined);
    if (textSearched.isEmpty) {
      clientsShowed = tempList;
    } else {
      clientsShowed = tempList
          .where((client) => client.toJson().toString().contains(textSearched))
          .toList();
    }
    notifyListeners();
  }

  onEdit(ClientsModel clientsShowed) {
    _clientService
      ..clientStateValue.value = ItemState.edit
      ..clientSelectedValue.value = clientsShowed;
    showDialog();
    notifyListeners();
  }

  onDelete(ClientsModel clientsShowed) {
    DialogService()
        .showDialog(
            description: lang.areYouSure, cancelTitle: lang.cancelButton)
        .then((onValue) {
      if (onValue?.confirmed ?? false) {
        _clientService
            .deleteClient(clientsShowed)
            .then((value) => _onValidate(value, clientsShowed));
      }
    });
  }

  FutureOr _onValidate(onValue, ClientsModel clientsShowed) {
    if (onValue is! Exception) {
      DialogService().showDialog(description: lang.deleted).then((onValue) {
        _clientService.listOfClientsValue.value.remove(clientsShowed);
        _calculatePaggined();
      });
    }
  }

  void logout() {
    _authenticationService.logout().then((_) {
      _navigationService.replaceWithLoginView();
    }).catchError((onError) {
      DialogService().showDialog(description: '$onError');
    });
  }
}
