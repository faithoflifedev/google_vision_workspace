// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      code: json['code'] as int,
      message: json['message'] as String,
<<<<<<< HEAD
      details: json['details'] as List<dynamic>?,
=======
      details: json['details'] as List<dynamic>,
>>>>>>> fdaccb1 ('added support for more detection methods')
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
    };
