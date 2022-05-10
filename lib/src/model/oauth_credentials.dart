import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

part 'oauth_credentials.g.dart';

@JsonSerializable()
class OAuthCredentials {
  final String clientId;
  final String clientSecret;
  final String? code;

  OAuthCredentials(
      {required this.clientId, required this.clientSecret, this.code});

  factory OAuthCredentials.fromYamlFile(File yamlFile) {
    return OAuthCredentials.fromYamlString(yamlFile.readAsStringSync());
  }

  factory OAuthCredentials.fromYaml(String yamlFilePath) {
    return OAuthCredentials.fromYamlString(
        File(yamlFilePath).readAsStringSync());
  }

  factory OAuthCredentials.fromYamlString(String yaml) {
    final jsonString = jsonEncode(loadYaml(yaml));

    return OAuthCredentials.fromJson(jsonDecode(jsonString));
  }

  factory OAuthCredentials.fromJsonFile(File jsonFile) {
    return OAuthCredentials.fromJsonString(jsonFile.readAsStringSync());
  }

  factory OAuthCredentials.fromJsonString(String jsonString) {
    return OAuthCredentials.fromJson(jsonDecode(jsonString));
  }

  factory OAuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$OAuthCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$OAuthCredentialsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
