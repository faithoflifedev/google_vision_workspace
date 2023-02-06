import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';

part 'localized_object_annotation.g.dart';

/// Set of detected objects with bounding boxes.
@JsonSerializable(explicitToJson: true)
class LocalizedObjectAnnotation {
  /// Object ID that should align with EntityAnnotation mid.
  final String mid;

  /// Object name, expressed in its languageCode language.
  final String name;

  /// Score of the result. Range [0, 1].
  final double score;

  /// Image region to which this object belongs. This must be populated.
  final BoundingPoly boundingPoly;

  LocalizedObjectAnnotation(
      {required this.mid,
      required this.name,
      required this.score,
      required this.boundingPoly});

  factory LocalizedObjectAnnotation.fromJson(Map<String, dynamic> json) =>
      _$LocalizedObjectAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizedObjectAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
