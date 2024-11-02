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
}
