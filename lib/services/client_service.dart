import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/client_model.dart';
import 'package:tots_test/models/get_clients_response.dart';
import 'package:tots_test/services/api_service.dart';
import 'package:tots_test/util/item_state.dart';

class ClientService with ListenableServiceMixin {
  final _apiService = locator<ApiService>();

  final clientLoadingValue = ReactiveValue(false);
  final listOfClientsValue = ReactiveValue<List<ClientsModel>>([]);
  final clientSelectedValue = ReactiveValue<ClientsModel?>(null);
  final clientAmbLoadingValue = ReactiveValue(false);
  final clientStateValue = ReactiveValue<ItemState>(ItemState.create);

  ClientService() {
    listenToReactiveValues([
      listOfClientsValue,
      clientSelectedValue,
      clientLoadingValue,
      clientAmbLoadingValue,
    ]);
  }

  set setListOfClients(List<ClientsModel> list) =>
      listOfClientsValue.value = list;

  set setGetClient(ClientsModel client) => clientSelectedValue.value = client;

  Future<dynamic> getClients() async {
    clientLoadingValue.value = true;
    return _apiService.getClients().then((response) {
      if (response is Exception) {
        DialogService().showDialog(description: '$response');
      } else {
        setListOfClients = (response as GetClientsResponse).data ?? [];
        return clientSelectedValue.value;
      }
    }).whenComplete(() => clientLoadingValue.value = false);
  }

  Future<dynamic> createClient(ClientsModel request) async {
    clientAmbLoadingValue.value = true;
    return _apiService.createClient(request).then((response) {
      if (response is Exception) {
        DialogService().showDialog(description: '$response');
      } else {
        return response;
      }
    }).whenComplete(() => clientAmbLoadingValue.value = false);
  }

  Future<dynamic> updateClient(ClientsModel request) async {
    clientAmbLoadingValue.value = true;
    return _apiService.updateClient(request).then((response) {
      if (response is Exception) {
        DialogService().showDialog(description: '$response');
      } else {
        return response;
      }
    }).whenComplete(() => clientAmbLoadingValue.value = false);
  }

  Future<dynamic> getClient(ClientsModel request) async {
    clientAmbLoadingValue.value = true;
    return _apiService.getClient(request.id ?? 0).then((response) {
      if (response is Exception) {
        DialogService().showDialog(description: '$response');
      } else {
        setGetClient = response as ClientsModel;
        return response;
      }
    }).whenComplete(() => clientAmbLoadingValue.value = false);
  }

  Future<dynamic> deleteClient(ClientsModel request) async {
    clientLoadingValue.value = true;
    return _apiService.deleteClient(request.id ?? 0).then((response) {
      if (response is Exception) {
        DialogService().showDialog(description: '$response');
      } else {
        return response;
      }
    }).whenComplete(() => clientLoadingValue.value = false);
  }
}
