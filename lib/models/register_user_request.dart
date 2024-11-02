import 'package:json_annotation/json_annotation.dart';
part 'register_user_request.g.dart';

@JsonSerializable()
class RegisterUserRequest {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "firstname")
  String? firstname;

  RegisterUserRequest({
    this.email,
    this.password,
    this.firstname,
  });

  factory RegisterUserRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserRequestToJson(this);
}
