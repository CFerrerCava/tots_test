// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthModelResponseAdapter extends TypeAdapter<AuthModelResponse> {
  @override
  final int typeId = 0;

  @override
  AuthModelResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthModelResponse(
      id: fields[0] as int?,
      email: fields[1] as String?,
      tokenType: fields[2] as String?,
      accessToken: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthModelResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.tokenType)
      ..writeByte(4)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthModelResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModelResponse _$AuthModelResponseFromJson(Map<String, dynamic> json) =>
    AuthModelResponse(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      tokenType: json['token_type'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$AuthModelResponseToJson(AuthModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'token_type': instance.tokenType,
      'access_token': instance.accessToken,
    };
