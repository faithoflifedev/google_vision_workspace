// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityAnnotation _$EntityAnnotationFromJson(Map<String, dynamic> json) =>
    EntityAnnotation(
      mid: json['mid'] as String?,
      locale: json['locale'] as String?,
      description: json['description'] as String,
      score: (json['score'] as num?)?.toDouble(),
      topicality: (json['topicality'] as num?)?.toDouble(),
      boundingPoly: json['boundingPoly'] == null
          ? null
          : BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
      locationInfo: (json['locationInfo'] as List<dynamic>?)
          ?.map((e) => LocationInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntityAnnotationToJson(EntityAnnotation instance) =>
    <String, dynamic>{
      'mid': instance.mid,
      'locale': instance.locale,
      'description': instance.description,
      'score': instance.score,
      'topicality': instance.topicality,
      'boundingPoly': instance.boundingPoly?.toJson(),
      'locationInfo': instance.locationInfo?.map((e) => e.toJson()).toList(),
      'properties': instance.properties?.map((e) => e.toJson()).toList(),
    };
