// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotate_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotateFileResponse _$AnnotateFileResponseFromJson(
  Map<String, dynamic> json,
) => AnnotateFileResponse(
  inputConfig: json['inputConfig'] as String?,
  responses: (json['responses'] as List<dynamic>?)
      ?.map((e) => AnnotateImageResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPages: (json['totalPages'] as num).toInt(),
  error: json['error'] == null
      ? null
      : Status.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AnnotateFileResponseToJson(
  AnnotateFileResponse instance,
) => <String, dynamic>{
  'inputConfig': instance.inputConfig,
  'responses': instance.responses,
  'totalPages': instance.totalPages,
  'error': instance.error,
};
