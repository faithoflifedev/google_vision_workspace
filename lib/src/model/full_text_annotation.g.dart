// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_text_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullTextAnnotation _$FullTextAnnotationFromJson(Map<String, dynamic> json) =>
    FullTextAnnotation(
      pages: (json['pages'] as List<dynamic>)
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$FullTextAnnotationToJson(FullTextAnnotation instance) =>
    <String, dynamic>{
      'pages': instance.pages.map((e) => e.toJson()).toList(),
      'text': instance.text,
    };
