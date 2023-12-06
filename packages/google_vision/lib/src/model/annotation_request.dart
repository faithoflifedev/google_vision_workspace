import 'dart:convert' show json;

import 'package:google_vision/google_vision.dart';
import 'package:json_annotation/json_annotation.dart';

part 'annotation_request.g.dart';

/// Individual image annotation requests for this batch.
@JsonSerializable(createToJson: false, includeIfNull: false)
class AnnotationRequest {
  /// The image to be processed.
  @JsonKey(name: 'image')
  final JsonImage jsonImage;

  /// Requested features.
  final List<Feature> features;

  /// Additional context that may accompany the image.
  final ImageContext? imageContext;

  /// Individual image annotation requests for this batch.
  AnnotationRequest({
    required this.jsonImage,
    required this.features,
    this.imageContext,
  });

  factory AnnotationRequest.fromJson(Map<String, dynamic> json) =>
      _$AnnotationRequestFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'image': jsonImage.toJson(),
        'features': features.map((e) => e.toJson()).toList(),
        'imageContext': imageContext?.toJson(),
      };

  @override
  String toString() => json.encode(toJson());
}
