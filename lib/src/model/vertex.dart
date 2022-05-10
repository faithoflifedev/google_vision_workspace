import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'vertex.g.dart';

///A vertex represents a 2D point in the image. NOTE: the vertex coordinates are
///in the same scale as the original image.
@JsonSerializable()
class Vertex {
  @JsonKey(defaultValue: 0)
  final int x;

  @JsonKey(defaultValue: 0)
  final int y;

  Vertex({required this.x, required this.y});

  factory Vertex.fromJson(Map<String, dynamic> json) => _$VertexFromJson(json);

  Map<String, dynamic> toJson() => _$VertexToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
