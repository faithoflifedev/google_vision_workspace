// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature.dart';

// **************************************************************************
// EasyEnumGenerator
// **************************************************************************

extension DetectionTypeExt on DetectionType {
  String get value => [
        'TEXT_DETECTION',
        'DOCUMENT_TEXT_DETECTION',
        'CROP_HINTS',
        'FACE_DETECTION',
        'IMAGE_PROPERTIES',
        'LABEL_DETECTION',
        'LANDMARK_DETECTION',
        'LOGO_DETECTION',
        'OBJECT_LOCALIZATION',
        'SAFE_SEARCH_DETECTION',
        'WEB_DETECTION'
      ][index];
}

extension DetectionTypeTxe on String {
  DetectionType? get detectionType => {
        'TEXT_DETECTION': DetectionType.TEXT_DETECTION,
        'DOCUMENT_TEXT_DETECTION': DetectionType.DOCUMENT_TEXT_DETECTION,
        'CROP_HINTS': DetectionType.CROP_HINTS,
        'FACE_DETECTION': DetectionType.FACE_DETECTION,
        'IMAGE_PROPERTIES': DetectionType.IMAGE_PROPERTIES,
        'LABEL_DETECTION': DetectionType.LABEL_DETECTION,
        'LANDMARK_DETECTION': DetectionType.LANDMARK_DETECTION,
        'LOGO_DETECTION': DetectionType.LOGO_DETECTION,
        'OBJECT_LOCALIZATION': DetectionType.OBJECT_LOCALIZATION,
        'SAFE_SEARCH_DETECTION': DetectionType.SAFE_SEARCH_DETECTION,
        'WEB_DETECTION': DetectionType.WEB_DETECTION,
      }[this];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      maxResults: json['maxResults'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'maxResults': instance.maxResults,
      'type': instance.type,
    };
