// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounding_poly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoundingPoly _$BoundingPolyFromJson(Map<String, dynamic> json) => BoundingPoly(
      normalizedVertices: (json['normalizedVertices'] as List<dynamic>?)
              ?.map((e) => NormalizedVertex.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      vertices: (json['vertices'] as List<dynamic>?)
              ?.map((e) => Vertex.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BoundingPolyToJson(BoundingPoly instance) =>
    <String, dynamic>{
      'normalizedVertices':
          instance.normalizedVertices.map((e) => e.toJson()).toList(),
      'vertices': instance.vertices.map((e) => e.toJson()).toList(),
    };
