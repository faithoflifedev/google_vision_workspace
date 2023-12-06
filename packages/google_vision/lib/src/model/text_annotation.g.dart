// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextAnnotation _$TextAnnotationFromJson(Map<String, dynamic> json) =>
    TextAnnotation(
      locale: json['locale'] as String?,
      description: json['description'] as String?,
      boundingPoly: json['boundingPoly'] == null
          ? null
          : BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextAnnotationToJson(TextAnnotation instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'description': instance.description,
      'boundingPoly': instance.boundingPoly?.toJson(),
    };
