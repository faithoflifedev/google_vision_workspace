import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'text_detection_params.g.dart';

/// Parameters for text detection and document text detection.
@JsonSerializable()
class TextDetectionParams {
  /// By default, Cloud Vision API only includes confidence score for
  /// DOCUMENT_TEXT_DETECTION result. Set the flag to true to include confidence
  /// score for TEXT_DETECTION as well.
  final bool enableTextDetectionConfidenceScore;

  TextDetectionParams({required this.enableTextDetectionConfidenceScore});

  factory TextDetectionParams.fromJson(Map<String, dynamic> json) =>
      _$TextDetectionParamsFromJson(json);

  Map<String, dynamic> toJson() => _$TextDetectionParamsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
