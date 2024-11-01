// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model_response.dart';

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
