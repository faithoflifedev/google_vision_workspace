import 'dart:convert';

import 'package:google_vision/google_vision.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image_context.dart';

part 'annotation_request.g.dart';

/// Individual image annotation requests for this batch.
@JsonSerializable(explicitToJson: true)
class AnnotationRequest {
  /// The image to be processed.
  final Painter painter;

  /// Requested features.
  final List<Feature> features;

  /// Additional context that may accompany the image.
  final ImageContext? imageContext;

  /// Individual image annotation requests for this batch.
  AnnotationRequest(
      {required this.painter, required this.features, this.imageContext});

  factory AnnotationRequest.fromJson(Map<String, dynamic> json) =>
      _$AnnotationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotationRequestToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
