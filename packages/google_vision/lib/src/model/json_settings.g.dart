// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonSettings _$JsonSettingsFromJson(Map<String, dynamic> json) => JsonSettings(
      type: json['type'] as String,
      projectId: json['project_id'] as String,
      projectKeyId: json['private_key_id'] as String,
      privateKey: json['private_key'] as String,
      clientEmail: json['client_email'] as String,
      clientId: json['client_id'] as String,
      authUri: json['auth_uri'] as String,
      tokenUri: json['token_uri'] as String,
      authProviderX509CertUrl: json['auth_provider_x509_cert_url'] as String,
      clientX509CertUrl: json['client_x509_cert_url'] as String,
    );

Map<String, dynamic> _$JsonSettingsToJson(JsonSettings instance) =>
    <String, dynamic>{
      'type': instance.type,
      'project_id': instance.projectId,
      'private_key_id': instance.projectKeyId,
      'private_key': instance.privateKey,
      'client_email': instance.clientEmail,
      'client_id': instance.clientId,
      'auth_uri': instance.authUri,
      'token_uri': instance.tokenUri,
      'auth_provider_x509_cert_url': instance.authProviderX509CertUrl,
      'client_x509_cert_url': instance.clientX509CertUrl,
    };
