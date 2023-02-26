// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_properties_annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagePropertiesAnnotation _$ImagePropertiesAnnotationFromJson(
        Map<String, dynamic> json) =>
    ImagePropertiesAnnotation(
      dominantColors: DominantColorsAnnotation.fromJson(
          json['dominantColors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagePropertiesAnnotationToJson(
        ImagePropertiesAnnotation instance) =>
    <String, dynamic>{
      'dominantColors': instance.dominantColors,
    };
