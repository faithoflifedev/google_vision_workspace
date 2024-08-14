// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_annotation_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageAnnotationContext _$ImageAnnotationContextFromJson(
        Map<String, dynamic> json) =>
    ImageAnnotationContext(
      uri: json['uri'] as String?,
      pageNumber: (json['pageNumber'] as num).toInt(),
    );

Map<String, dynamic> _$ImageAnnotationContextToJson(
        ImageAnnotationContext instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'pageNumber': instance.pageNumber,
    };
