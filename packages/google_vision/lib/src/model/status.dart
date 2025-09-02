import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

/// The Status type defines a logical error model that is suitable for different
/// programming environments, including REST APIs and RPC APIs. It is used by
/// gRPC. Each Status message contains three pieces of data: error code, error
/// message, and error details.
@JsonSerializable()
class Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  final int code;

  /// A developer-facing error message, which should be in English. Any
  /// user-facing error message should be localized and sent in the
  /// google.rpc.Status.details field, or localized by the client.
  final String message;

  final List<dynamic>? details;

  Status({required this.code, required this.message, this.details});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
