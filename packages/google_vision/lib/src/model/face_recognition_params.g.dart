// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_recognition_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceRecognitionParams _$FaceRecognitionParamsFromJson(
  Map<String, dynamic> json,
) => FaceRecognitionParams(
  celebritySet: (json['celebritySet'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$FaceRecognitionParamsToJson(
  FaceRecognitionParams instance,
) => <String, dynamic>{'celebritySet': instance.celebritySet};
