// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtCredentials _$JwtCredentialsFromJson(Map<String, dynamic> json) =>
    JwtCredentials(
      settings: JsonSettings.fromJson(json['settings'] as Map<String, dynamic>),
      scope: json['scope'] as String,
    );

Map<String, dynamic> _$JwtCredentialsToJson(JwtCredentials instance) =>
    <String, dynamic>{
      'settings': instance.settings.toJson(),
      'scope': instance.scope,
    };
