// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      maxResults: json['maxResults'] as int?,
      type: $enumDecode(_$AnnotationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'maxResults': instance.maxResults,
      'type': _$AnnotationTypeEnumMap[instance.type]!,
    };

const _$AnnotationTypeEnumMap = {
  AnnotationType.faceDetection: 'FACE_DETECTION',
  AnnotationType.landmarkDetection: 'LANDMARK_DETECTION',
  AnnotationType.logoDetection: 'LOGO_DETECTION',
  AnnotationType.labelDetection: 'LABEL_DETECTION',
  AnnotationType.objectLocalization: 'OBJECT_LOCALIZATION',
  AnnotationType.textDetection: 'TEXT_DETECTION',
  AnnotationType.safeSearchDetection: 'SAFE_SEARCH_DETECTION',
  AnnotationType.imageProperties: 'IMAGE_PROPERTIES',
  AnnotationType.cropHints: 'CROP_HINTS',
  AnnotationType.webDetection: 'WEB_DETECTION',
  AnnotationType.productSearch: 'PRODUCT_SEARCH',
};
