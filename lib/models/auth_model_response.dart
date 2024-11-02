import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class AuthModelResponse {
  @HiveField(0)
  @JsonKey(name: "id")
  int? id;

  @HiveField(1)
  @JsonKey(name: "email")
  String? email;

  @HiveField(2)
  @JsonKey(name: "token_type")
  @HiveField(3)
  String? tokenType;

  @HiveField(4)
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
