// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_detection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebDetection _$WebDetectionFromJson(Map<String, dynamic> json) => WebDetection(
  webEntities: (json['webEntities'] as List<dynamic>?)
      ?.map((e) => WebEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  fullMatchingImages: (json['fullMatchingImages'] as List<dynamic>?)
      ?.map((e) => WebImage.fromJson(e as Map<String, dynamic>))
      .toList(),
  partialMatchingImages: (json['partialMatchingImages'] as List<dynamic>?)
      ?.map((e) => WebImage.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagesWithMatchingImages: (json['pagesWithMatchingImages'] as List<dynamic>?)
      ?.map((e) => WebPage.fromJson(e as Map<String, dynamic>))
      .toList(),
  visuallySimilarImages: (json['visuallySimilarImages'] as List<dynamic>?)
      ?.map((e) => WebImage.fromJson(e as Map<String, dynamic>))
      .toList(),
  bestGuessLabels: (json['bestGuessLabels'] as List<dynamic>?)
      ?.map((e) => WebLabel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WebDetectionToJson(WebDetection instance) =>
    <String, dynamic>{
      'webEntities': instance.webEntities,
      'fullMatchingImages': instance.fullMatchingImages,
      'partialMatchingImages': instance.partialMatchingImages,
      'pagesWithMatchingImages': instance.pagesWithMatchingImages,
      'visuallySimilarImages': instance.visuallySimilarImages,
      'bestGuessLabels': instance.bestGuessLabels,
    };
