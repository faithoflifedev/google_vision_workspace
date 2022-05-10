import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';

part 'localized_object_annotation.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalizedObjectAnnotation {
  final String mid;
  final String name;
  final double score;
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
