import 'package:json_annotation/json_annotation.dart';
part 'auth_model_request.g.dart';

@JsonSerializable()
class AuthRequest {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;

  AuthRequest({
    this.email,
    this.password,
  });

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
