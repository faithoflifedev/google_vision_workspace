// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotate_file_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotateFileRequest _$AnnotateFileRequestFromJson(Map<String, dynamic> json) =>
    AnnotateFileRequest(
      inputConfig:
          InputConfig.fromJson(json['inputConfig'] as Map<String, dynamic>),
      features: (json['features'] as List<dynamic>)
          .map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageContext: json['imageContext'] == null
          ? null
          : ImageContext.fromJson(json['imageContext'] as Map<String, dynamic>),
      pages: (json['pages'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$AnnotateFileRequestToJson(
        AnnotateFileRequest instance) =>
    <String, dynamic>{
      'inputConfig': instance.inputConfig,
      'features': instance.features,
      'imageContext': instance.imageContext,
      'pages': instance.pages,
    };
