// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_annotate_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchAnnotateImagesResponse _$BatchAnnotateImagesResponseFromJson(
  Map<String, dynamic> json,
) => BatchAnnotateImagesResponse(
  responses: (json['responses'] as List<dynamic>)
      .map((e) => AnnotateImageResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BatchAnnotateImagesResponseToJson(
  BatchAnnotateImagesResponse instance,
) => <String, dynamic>{
  'responses': instance.responses.map((e) => e.toJson()).toList(),
};
