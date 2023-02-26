// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotate_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotateImageResponse _$AnnotateImageResponseFromJson(
        Map<String, dynamic> json) =>
    AnnotateImageResponse(
      faceAnnotationList: (json['faceAnnotations'] as List<dynamic>?)
          ?.map((e) => FaceAnnotation.fromJson(e as Map<String, dynamic>))
          .toList(),
      localizedObjectAnnotationList:
          (json['localizedObjectAnnotations'] as List<dynamic>?)
              ?.map((e) =>
                  LocalizedObjectAnnotation.fromJson(e as Map<String, dynamic>))
              .toList(),
      labelAnnotationList: (json['labelAnnotations'] as List<dynamic>?)
          ?.map((e) => LabelAnnotation.fromJson(e as Map<String, dynamic>))
          .toList(),
      textAnnotationsList: (json['textAnnotations'] as List<dynamic>?)
          ?.map((e) => TextAnnotation.fromJson(e as Map<String, dynamic>))
          .toList(),
      safeSearchAnnotation: json['safeSearchAnnotation'] == null
          ? null
          : SafeSearchAnnotation.fromJson(
              json['safeSearchAnnotation'] as Map<String, dynamic>),
      fullTextAnnotation: json['fullTextAnnotation'] == null
          ? null
          : FullTextAnnotation.fromJson(
              json['fullTextAnnotation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnotateImageResponseToJson(
        AnnotateImageResponse instance) =>
    <String, dynamic>{
      'faceAnnotations':
          instance.faceAnnotationList?.map((e) => e.toJson()).toList(),
      'localizedObjectAnnotations': instance.localizedObjectAnnotationList
          ?.map((e) => e.toJson())
          .toList(),
      'labelAnnotations':
          instance.labelAnnotationList?.map((e) => e.toJson()).toList(),
      'textAnnotations':
          instance.textAnnotationsList?.map((e) => e.toJson()).toList(),
      'safeSearchAnnotation': instance.safeSearchAnnotation?.toJson(),
      'fullTextAnnotation': instance.fullTextAnnotation?.toJson(),
    };
