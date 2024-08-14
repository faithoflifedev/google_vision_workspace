// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotate_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotateImageRequest _$AnnotateImageRequestFromJson(
        Map<String, dynamic> json) =>
    AnnotateImageRequest(
      jsonImage: JsonImage.fromJson(json['image'] as Map<String, dynamic>),
      features: (json['features'] as List<dynamic>)
          .map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageContext: json['imageContext'] == null
          ? null
          : ImageContext.fromJson(json['imageContext'] as Map<String, dynamic>),
    );
