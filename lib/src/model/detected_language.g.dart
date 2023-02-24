// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectedLanguage _$DetectedLanguageFromJson(Map<String, dynamic> json) =>
    DetectedLanguage(
      languageCode: json['languageCode'] as String,
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DetectedLanguageToJson(DetectedLanguage instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'confidence': instance.confidence,
    };
