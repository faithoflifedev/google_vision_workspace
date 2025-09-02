// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Annotation _$AnnotationFromJson(Map<String, dynamic> json) => Annotation(
  description: json['description'] as String,
  boundingPoly: json['boundingPoly'] == null
      ? null
      : BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
  isLocalized: json['isLocalized'] as bool? ?? false,
  score: (json['score'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AnnotationToJson(Annotation instance) =>
    <String, dynamic>{
      'description': instance.description,
      'boundingPoly': instance.boundingPoly,
      'score': instance.score,
    };
