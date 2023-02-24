import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';

part 'text_annotation.g.dart';

/// Set of detected texts with bounding boxes.
@JsonSerializable(explicitToJson: true)
class TextAnnotation {
  /// The language code for the locale in which the entity textual description is expressed.
  final String? locale;

  /// Entity textual description, expressed in its locale language.
  final String description;

  /// Image region to which this text belongs. This must be populated.
  final BoundingPoly boundingPoly;

  TextAnnotation(
      {required this.locale,
      required this.description,
      required this.boundingPoly});

  factory TextAnnotation.fromJson(Map<String, dynamic> json) =>
      _$TextAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$TextAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
