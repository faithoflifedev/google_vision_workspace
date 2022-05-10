// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthCredentials _$OAuthCredentialsFromJson(Map<String, dynamic> json) =>
    OAuthCredentials(
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$OAuthCredentialsToJson(OAuthCredentials instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
      'code': instance.code,
    };
