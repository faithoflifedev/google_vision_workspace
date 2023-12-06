// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotationRequests _$AnnotationRequestsFromJson(Map<String, dynamic> json) =>
    AnnotationRequests(
      requests: (json['requests'] as List<dynamic>)
          .map((e) => AnnotationRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnnotationRequestsToJson(AnnotationRequests instance) =>
    <String, dynamic>{
      'requests': instance.requests.map((e) => e.toJson()).toList(),
    };
