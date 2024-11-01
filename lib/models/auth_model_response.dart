import 'package:json_annotation/json_annotation.dart';

part 'auth_model_response.g.dart';

@JsonSerializable()
class AuthModelResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "token_type")
  String? tokenType;
  @JsonKey(name: "access_token")
  String? accessToken;

  AuthModelResponse({
    this.id,
    this.email,
    this.tokenType,
    this.accessToken,
  });

  factory AuthModelResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelResponseToJson(this);
}
