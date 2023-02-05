// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_search_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafeSearchAnnotation _$SafeSearchAnnotationFromJson(
        Map<String, dynamic> json) =>
    SafeSearchAnnotation(
      adult: $enumDecodeNullable(_$SafeSearchDectionTypeEnumMap, json['adult'],
              unknownValue: SafeSearchDectionType.UNKNOWN) ??
          SafeSearchDectionType.UNKNOWN,
      medical: $enumDecodeNullable(
              _$SafeSearchDectionTypeEnumMap, json['medical'],
              unknownValue: SafeSearchDectionType.UNKNOWN) ??
          SafeSearchDectionType.UNKNOWN,
      rancy: $enumDecodeNullable(_$SafeSearchDectionTypeEnumMap, json['rancy'],
              unknownValue: SafeSearchDectionType.UNKNOWN) ??
          SafeSearchDectionType.UNKNOWN,
      spoof: $enumDecodeNullable(_$SafeSearchDectionTypeEnumMap, json['spoof'],
              unknownValue: SafeSearchDectionType.UNKNOWN) ??
          SafeSearchDectionType.UNKNOWN,
      violence: $enumDecodeNullable(
              _$SafeSearchDectionTypeEnumMap, json['violence'],
              unknownValue: SafeSearchDectionType.UNKNOWN) ??
          SafeSearchDectionType.UNKNOWN,
    );

Map<String, dynamic> _$SafeSearchAnnotationToJson(
        SafeSearchAnnotation instance) =>
    <String, dynamic>{
      'adult': _$SafeSearchDectionTypeEnumMap[instance.adult]!,
      'spoof': _$SafeSearchDectionTypeEnumMap[instance.spoof]!,
      'medical': _$SafeSearchDectionTypeEnumMap[instance.medical]!,
      'violence': _$SafeSearchDectionTypeEnumMap[instance.violence]!,
      'rancy': _$SafeSearchDectionTypeEnumMap[instance.rancy]!,
    };

const _$SafeSearchDectionTypeEnumMap = {
  SafeSearchDectionType.VERY_LIKELY: 'VERY_LIKELY',
  SafeSearchDectionType.LIKELY: 'LIKELY',
  SafeSearchDectionType.UNLIKELY: 'UNLIKELY',
  SafeSearchDectionType.VERY_UNLIKELY: 'VERY_UNLIKELY',
  SafeSearchDectionType.POSSIBLE: 'POSSIBLE',
  SafeSearchDectionType.UNKNOWN: 'UNKNOWN',
};
