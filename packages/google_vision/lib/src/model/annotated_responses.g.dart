// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotated_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotatedResponses _$AnnotatedResponsesFromJson(Map<String, dynamic> json) =>
    AnnotatedResponses(
      responses: (json['responses'] as List<dynamic>)
          .map((e) => AnnotateImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnnotatedResponsesToJson(AnnotatedResponses instance) =>
    <String, dynamic>{
      'responses': instance.responses.map((e) => e.toJson()).toList(),
    };
