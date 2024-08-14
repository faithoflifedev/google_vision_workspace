import 'dart:convert';

import 'package:google_vision/google_vision.dart';
import 'package:json_annotation/json_annotation.dart';

part 'annotate_image_requests.g.dart';

/// Request for performing Google Cloud Vision API tasks over a user-provided
/// image, with user-requested features, and with context information.
@JsonSerializable(explicitToJson: true)
class AnnotateImageRequests implements AnnotateJsonSerializable {
  final List<AnnotateImageRequest> requests;

  AnnotateImageRequests({
    required this.requests,
  });

  factory AnnotateImageRequests.fromJson(Map<String, dynamic> json) =>
      _$AnnotateImageRequestsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AnnotateImageRequestsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}

@Deprecated('Use AnnotateImageRequests instead.')
class AnnotationRequests extends AnnotateImageRequests {
  AnnotationRequests({required super.requests});
}
