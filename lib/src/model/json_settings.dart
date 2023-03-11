import 'dart:convert' show json;
import 'package:json_annotation/json_annotation.dart';

part 'json_settings.g.dart';

/// Model of the Json/authentication file provided by Google
@JsonSerializable()
class JsonSettings {
  final String type;

  @JsonKey(name: 'project_id')
  final String projectId;

  @JsonKey(name: 'private_key_id')
  final String projectKeyId;

  @JsonKey(name: 'private_key')
  final String privateKey;

  @JsonKey(name: 'client_email')
  final String clientEmail;

  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'auth_uri')
  final String authUri;

  @JsonKey(name: 'token_uri')
  final String tokenUri;

  @JsonKey(name: 'auth_provider_x509_cert_url')
  final String authProviderX509CertUrl;

  @JsonKey(name: 'client_x509_cert_url')
  final String clientX509CertUrl;

  JsonSettings(
      {required this.type,
      required this.projectId,
      required this.projectKeyId,
      required this.privateKey,
      required this.clientEmail,
      required this.clientId,
      required this.authUri,
      required this.tokenUri,
      required this.authProviderX509CertUrl,
      required this.clientX509CertUrl});

  factory JsonSettings.fromJson(Map<String, dynamic> json) =>
      _$JsonSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$JsonSettingsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
