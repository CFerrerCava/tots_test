import 'package:json_annotation/json_annotation.dart';
part 'register_user_response.g.dart';

@JsonSerializable()
class RegisterUserResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "email")
  String? email;

  RegisterUserResponse({
    this.id,
    this.email,
  });

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserResponseToJson(this);
}
