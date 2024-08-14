import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'gcs_source.g.dart';

@JsonSerializable()
class GcsSource {
  /// Google Cloud Storage URI for the input file. This must only be a Google
  /// Cloud Storage object. Wildcards are not currently supported.
  final String uri;

  GcsSource({
    required this.uri,
  });

  factory GcsSource.fromJson(Map<String, dynamic> json) =>
      _$GcsSourceFromJson(json);

  Map<String, dynamic> toJson() => _$GcsSourceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
