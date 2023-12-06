// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextProperty _$TextPropertyFromJson(Map<String, dynamic> json) => TextProperty(
      detectedLanguages: (json['detectedLanguages'] as List<dynamic>?)
          ?.map((e) => DetectedLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      detectedBreak: json['detectedBreak'] == null
          ? null
          : DetectedBreak.fromJson(
              json['detectedBreak'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextPropertyToJson(TextProperty instance) =>
    <String, dynamic>{
      'detectedLanguages':
          instance.detectedLanguages?.map((e) => e.toJson()).toList(),
      'detectedBreak': instance.detectedBreak?.toJson(),
    };
