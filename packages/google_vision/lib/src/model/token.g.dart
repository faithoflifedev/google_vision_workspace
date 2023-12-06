// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as int,
      scope: json['scope'] as String?,
      tokenType: json['token_type'] as String,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
    };
