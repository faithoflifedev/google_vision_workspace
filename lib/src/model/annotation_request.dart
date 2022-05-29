import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'image.dart';
import 'image_context.dart';
import 'feature.dart';

part 'annotation_request.g.dart';

///Individual image annotation requests for this batch.
@JsonSerializable(explicitToJson: true)
class AnnotationRequest {
  ///The image to be processed.
  final Image image;

  ///Requested features.
  final List<Feature> features;

  ///Additional context that may accompany the image.
  final ImageContext? imageContext;

  AnnotationRequest(
      {required this.image, required this.features, this.imageContext});

  factory AnnotationRequest.fromJson(Map<String, dynamic> json) =>
      _$AnnotationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotationRequestToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
