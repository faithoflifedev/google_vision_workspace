// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paragraph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paragraph _$ParagraphFromJson(Map<String, dynamic> json) => Paragraph(
      property: json['property'] == null
          ? null
          : TextProperty.fromJson(json['property'] as Map<String, dynamic>),
      boundingBox: json['boundingBox'] == null
          ? null
          : BoundingPoly.fromJson(json['boundingBox'] as Map<String, dynamic>),
      words: (json['words'] as List<dynamic>?)
          ?.map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ParagraphToJson(Paragraph instance) => <String, dynamic>{
      'property': instance.property?.toJson(),
      'boundingBox': instance.boundingBox?.toJson(),
      'words': instance.words?.map((e) => e.toJson()).toList(),
      'confidence': instance.confidence,
    };
