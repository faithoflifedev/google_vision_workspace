// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebEntity _$WebEntityFromJson(Map<String, dynamic> json) => WebEntity(
  entityId: json['entityId'] as String,
  score: json['score'] as num,
  description: json['description'] as String,
);

Map<String, dynamic> _$WebEntityToJson(WebEntity instance) => <String, dynamic>{
  'entityId': instance.entityId,
  'score': instance.score,
  'description': instance.description,
};
