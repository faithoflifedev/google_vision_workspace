import 'dart:convert';

import 'package:google_vision/google_vision.dart';
import 'package:json_annotation/json_annotation.dart';

part 'annotate_file_response.g.dart';

@JsonSerializable()
class AnnotateFileResponse {
  /// Information about the file for which this response is generated.
  final String? inputConfig;

  /// Individual responses to images found within the file. This field will be
  /// empty if the error field is set.
  final List<AnnotateImageResponse>? responses;

  /// This field gives the total number of pages in the file.
  final int totalPages;

  /// If set, represents the error message for the failed request. The responses
  /// field will not be set in this case.
  final Status? error;

  AnnotateFileResponse({
    this.inputConfig,
    this.responses,
    required this.totalPages,
    this.error,
  });

  factory AnnotateFileResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnotateFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotateFileResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
