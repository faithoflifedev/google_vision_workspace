import 'dart:convert' show json;

import 'package:google_vision/google_vision.dart';
import 'package:json_annotation/json_annotation.dart';

part 'annotate_image_request.g.dart';

/// Individual image annotation requests for this batch.
@JsonSerializable(createToJson: false, includeIfNull: false)
class AnnotateImageRequest {
  /// The image to be processed.
  @JsonKey(name: 'image')
  final JsonImage jsonImage;

  /// Requested features.
  final List<Feature> features;

  /// Additional context that may accompany the image.
  final ImageContext? imageContext;

  /// Individual image annotation requests for this batch.
  AnnotateImageRequest({
    required this.jsonImage,
    required this.features,
    this.imageContext,
  });

  factory AnnotateImageRequest.fromJson(Map<String, dynamic> json) =>
      _$AnnotateImageRequestFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'image': jsonImage.toJson(),
        'features': features.map((e) => e.toJson()).toList(),
        'imageContext': imageContext?.toJson(),
      };

  @override
  String toString() => json.encode(toJson());
}

@Deprecated('Use AnnotateImageRequest instead.')
class AnnotationRequest extends AnnotateImageRequest {
  AnnotationRequest({
    required super.jsonImage,
    required super.features,
  });
}
