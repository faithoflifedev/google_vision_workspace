// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectAnnotation _$ObjectAnnotationFromJson(Map<String, dynamic> json) =>
    ObjectAnnotation(
      mid: json['mid'] as String,
      languageCode: json['languageCode'] as String,
      name: json['name'] as String,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$ObjectAnnotationToJson(ObjectAnnotation instance) =>
    <String, dynamic>{
      'mid': instance.mid,
      'languageCode': instance.languageCode,
      'name': instance.name,
      'score': instance.score,
    };
