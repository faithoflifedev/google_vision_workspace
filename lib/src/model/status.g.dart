// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      code: json['code'] as int,
      message: json['message'] as String,
      details: json['details'] as List<dynamic>?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
    };
