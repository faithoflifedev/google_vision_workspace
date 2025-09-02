import 'dart:convert' show json;

import 'package:google_vision/google_vision.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_annotate_images_response.g.dart';

/// Response to a batch image annotation request.
@JsonSerializable(explicitToJson: true)
class BatchAnnotateImagesResponse {
  /// Individual responses to image annotation requests within the batch.
  final List<AnnotateImageResponse> responses;

  BatchAnnotateImagesResponse({required this.responses});

  factory BatchAnnotateImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchAnnotateImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BatchAnnotateImagesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}

@Deprecated('Use AnnotatedResponses')
class AnnotatedResponses extends BatchAnnotateImagesResponse {
  AnnotatedResponses({required super.responses});
}
