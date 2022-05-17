import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'normalized_vertex.dart';
import 'vertex.dart';

part 'bounding_poly.g.dart';

///The bounding polygon around the face. The coordinates of the bounding box are
///in the original image's scale. The bounding box is computed to "frame" the
///face in accordance with human expectations. It is based on the landmarker
///results. Note that one or more x and/or y coordinates may not be generated in
///the BoundingPoly (the polygon will be unbounded) if only a partial face
///appears in the image to be annotated.
@JsonSerializable(explicitToJson: true)
class BoundingPoly {
  ///The bounding polygon normalized vertices.
  @JsonKey(defaultValue: [])
  final List<NormalizedVertex> normalizedVertices;

  ///The bounding polygon vertices.
  @JsonKey(defaultValue: [])
  final List<Vertex> vertices;

  bool get isNormalized => normalizedVertices.isEmpty;

  BoundingPoly({required this.normalizedVertices, required this.vertices});

  factory BoundingPoly.fromJson(Map<String, dynamic> json) =>
      _$BoundingPolyFromJson(json);

  Map<String, dynamic> toJson() => _$BoundingPolyToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
