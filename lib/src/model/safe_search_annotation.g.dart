// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_search_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafeSearchAnnotation _$SafeSearchAnnotationFromJson(
        Map<String, dynamic> json) =>
    SafeSearchAnnotation(
      adult: $enumDecodeNullable(
              _$SafeSearchDetectionTypeEnumMap, json['adult'],
              unknownValue: SafeSearchDetectionType.UNKNOWN) ??
          SafeSearchDetectionType.UNKNOWN,
      medical: $enumDecodeNullable(
              _$SafeSearchDetectionTypeEnumMap, json['medical'],
              unknownValue: SafeSearchDetectionType.UNKNOWN) ??
          SafeSearchDetectionType.UNKNOWN,
      racy: $enumDecodeNullable(_$SafeSearchDetectionTypeEnumMap, json['racy'],
              unknownValue: SafeSearchDetectionType.UNKNOWN) ??
          SafeSearchDetectionType.UNKNOWN,
      spoof: $enumDecodeNullable(
              _$SafeSearchDetectionTypeEnumMap, json['spoof'],
              unknownValue: SafeSearchDetectionType.UNKNOWN) ??
          SafeSearchDetectionType.UNKNOWN,
      violence: $enumDecodeNullable(
              _$SafeSearchDetectionTypeEnumMap, json['violence'],
              unknownValue: SafeSearchDetectionType.UNKNOWN) ??
          SafeSearchDetectionType.UNKNOWN,
    );

Map<String, dynamic> _$SafeSearchAnnotationToJson(
        SafeSearchAnnotation instance) =>
    <String, dynamic>{
      'adult': _$SafeSearchDetectionTypeEnumMap[instance.adult]!,
      'spoof': _$SafeSearchDetectionTypeEnumMap[instance.spoof]!,
      'medical': _$SafeSearchDetectionTypeEnumMap[instance.medical]!,
      'violence': _$SafeSearchDetectionTypeEnumMap[instance.violence]!,
      'racy': _$SafeSearchDetectionTypeEnumMap[instance.racy]!,
    };

const _$SafeSearchDetectionTypeEnumMap = {
  SafeSearchDetectionType.VERY_LIKELY: 'VERY_LIKELY',
  SafeSearchDetectionType.LIKELY: 'LIKELY',
  SafeSearchDetectionType.UNLIKELY: 'UNLIKELY',
  SafeSearchDetectionType.VERY_UNLIKELY: 'VERY_UNLIKELY',
  SafeSearchDetectionType.POSSIBLE: 'POSSIBLE',
  SafeSearchDetectionType.UNKNOWN: 'UNKNOWN',
};
