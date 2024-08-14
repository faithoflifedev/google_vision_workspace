// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_annotate_files_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchAnnotateFilesResponse _$BatchAnnotateFilesResponseFromJson(
        Map<String, dynamic> json) =>
    BatchAnnotateFilesResponse(
      responses: (json['responses'] as List<dynamic>)
          .map((e) => AnnotateFileResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchAnnotateFilesResponseToJson(
        BatchAnnotateFilesResponse instance) =>
    <String, dynamic>{
      'responses': instance.responses,
    };
