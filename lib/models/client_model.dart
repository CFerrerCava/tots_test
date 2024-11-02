import 'package:json_annotation/json_annotation.dart';
part 'client_model.g.dart';

@JsonSerializable()
class ClientsModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "firstname")
  String? firstname;
  @JsonKey(name: "lastname")
  String? lastname;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "caption")
  String? caption;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "user_id")
  int? userId;

  ClientsModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.address,
    this.photo,
    this.caption,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory ClientsModel.fromJson(Map<String, dynamic> json) =>
      _$ClientsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientsModelToJson(this);
}
