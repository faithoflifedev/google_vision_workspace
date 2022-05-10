// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_object_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizedObjectAnnotation _$LocalizedObjectAnnotationFromJson(
        Map<String, dynamic> json) =>
    LocalizedObjectAnnotation(
      mid: json['mid'] as String,
      name: json['name'] as String,
      score: (json['score'] as num).toDouble(),
      boundingPoly:
          BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocalizedObjectAnnotationToJson(
        LocalizedObjectAnnotation instance) =>
    <String, dynamic>{
      'mid': instance.mid,
      'name': instance.name,
      'score': instance.score,
      'boundingPoly': instance.boundingPoly.toJson(),
    };
