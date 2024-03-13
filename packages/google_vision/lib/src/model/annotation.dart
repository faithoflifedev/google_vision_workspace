import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';

part 'annotation.g.dart';

@JsonSerializable()
class Annotation {
  /// Entity textual description, expressed in its locale language.
  final String description;

  /// Image region to which this entity belongs
  final BoundingPoly? boundingPoly;

  /// If true, indicates that this annotation refers to a localized region (% of
  /// width or height) of the image.
  @JsonKey(includeToJson: false)
  final bool isLocalized;

  /// Score of the result. Range \[0, 1\].
  final double? score;

  Annotation({
    required this.description,
    required this.boundingPoly,
    this.isLocalized = false,
    this.score,
  });

  factory Annotation.fromJson(Map<String, dynamic> json) =>
      _$AnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
