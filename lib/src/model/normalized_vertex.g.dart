// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normalized_vertex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NormalizedVertex _$NormalizedVertexFromJson(Map<String, dynamic> json) =>
    NormalizedVertex(
      x: (json['x'] as num?)?.toDouble() ?? 0.0,
      y: (json['y'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$NormalizedVertexToJson(NormalizedVertex instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
