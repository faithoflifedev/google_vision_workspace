// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dominant_colors_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DominantColorsAnnotation _$DominantColorsAnnotationFromJson(
  Map<String, dynamic> json,
) => DominantColorsAnnotation(
  colors: (json['colors'] as List<dynamic>)
      .map((e) => ColorInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DominantColorsAnnotationToJson(
  DominantColorsAnnotation instance,
) => <String, dynamic>{'colors': instance.colors};
