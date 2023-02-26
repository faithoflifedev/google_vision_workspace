// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_hints_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CropHintsAnnotation _$CropHintsAnnotationFromJson(Map<String, dynamic> json) =>
    CropHintsAnnotation(
      cropHints: (json['cropHints'] as List<dynamic>)
          .map((e) => CropHint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CropHintsAnnotationToJson(
        CropHintsAnnotation instance) =>
    <String, dynamic>{
      'cropHints': instance.cropHints,
    };
