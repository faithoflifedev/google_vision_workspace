// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotate_image_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotateImageRequests _$AnnotateImageRequestsFromJson(
        Map<String, dynamic> json) =>
    AnnotateImageRequests(
      requests: (json['requests'] as List<dynamic>)
          .map((e) => AnnotateImageRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnnotateImageRequestsToJson(
        AnnotateImageRequests instance) =>
    <String, dynamic>{
      'requests': instance.requests.map((e) => e.toJson()).toList(),
    };
