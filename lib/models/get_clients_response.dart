import 'package:json_annotation/json_annotation.dart';
import 'package:tots_test/models/client_model.dart';

part 'get_clients_response.g.dart';

@JsonSerializable()
class GetClientsResponse {
  @JsonKey(name: "data")
  List<ClientsModel>? data;

  GetClientsResponse({
    this.data,
  });

  factory GetClientsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetClientsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetClientsResponseToJson(this);
}
