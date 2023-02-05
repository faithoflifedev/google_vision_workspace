// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelAnnotation _$LabelAnnotationFromJson(Map<String, dynamic> json) =>
    LabelAnnotation(
      mid: json['mid'] as String,
      description: json['description'] as String,
      score: (json['score'] as num).toDouble(),
      topicality: (json['topicality'] as num).toDouble(),
    );

Map<String, dynamic> _$LabelAnnotationToJson(LabelAnnotation instance) =>
    <String, dynamic>{
      'mid': instance.mid,
      'description': instance.description,
      'score': instance.score,
      'topicality': instance.topicality,
    };
