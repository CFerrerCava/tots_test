import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/client_model.dart';
import 'package:tots_test/models/get_clients_response.dart';
import 'package:tots_test/services/api_service.dart';

class ClientService with ListenableServiceMixin {
  final _apiService = locator<ApiService>();

  @Factory()
  ClientService();

  final clientLoadingValue = ReactiveValue(false);
  final listOfClientsValue = ReactiveValue<List<ClientsModel>>([]);
  final clientSelectedValue = ReactiveValue<ClientsModel?>(null);

  @Factory()
  ClientService.from() {
    listenToReactiveValues([
      listOfClientsValue,
      clientSelectedValue,
      clientLoadingValue,
    ]);
  }

  set setListOfClients(List<ClientsModel> list) =>
      listOfClientsValue.value = list;

  set setGetClient(ClientsModel client) => clientSelectedValue.value = client;

  Future<void> getClients() async {
    clientLoadingValue.value = true;
    _apiService.getClients().then((response) {
      if (response is Exception) {
        // add way to handle exceptions
      } else {
        setListOfClients = (response as GetClientsResponse).data ?? [];
      }
    }).whenComplete(() => clientLoadingValue.value = false);
  }

  Future<dynamic> createClient(ClientsModel request) async {
    clientLoadingValue.value = true;
    _apiService.createClient(request).then((response) {
      if (response is Exception) {
        // add way to handle exceptions
      } else {}
    }).whenComplete(() => clientLoadingValue.value = false);
  }

  Future<dynamic> updateClient(ClientsModel request) async {
    clientLoadingValue.value = true;
    _apiService.updateClient(request).then((response) {
      if (response is Exception) {
        // add way to handle exceptions
      } else {}
    }).whenComplete(() => clientLoadingValue.value = false);
  }

  Future<dynamic> getClient(ClientsModel request) async {
    clientLoadingValue.value = true;
    _apiService.getClient(request.id ?? 0).then((response) {
      if (response is Exception) {
        // add way to handle exceptions
      } else {
        setGetClient = response as ClientsModel;
      }
    }).whenComplete(() => clientLoadingValue.value = false);
  }

  Future<dynamic> deleteClient(ClientsModel request) async {
    clientLoadingValue.value = true;
    _apiService.deleteClient(request.id ?? 0).then((response) {
      if (response is Exception) {
        // add way to handle exceptions
      } else {}
    }).whenComplete(() => clientLoadingValue.value = false);
  }
}
