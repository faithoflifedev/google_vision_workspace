// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebPage _$WebPageFromJson(Map<String, dynamic> json) => WebPage(
      url: json['url'] as String,
      score: json['score'] as num?,
      pageTitle: json['pageTitle'] as String,
      fullMatchingImages: (json['fullMatchingImages'] as List<dynamic>?)
          ?.map((e) => WebImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      partialMatchingImages: (json['partialMatchingImages'] as List<dynamic>?)
          ?.map((e) => WebImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WebPageToJson(WebPage instance) => <String, dynamic>{
      'url': instance.url,
      'score': instance.score,
      'pageTitle': instance.pageTitle,
      'fullMatchingImages': instance.fullMatchingImages,
      'partialMatchingImages': instance.partialMatchingImages,
    };
