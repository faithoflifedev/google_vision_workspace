import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'face_recognition_params.g.dart';

/// Individual image annotation requests for this batch.
@JsonSerializable(explicitToJson: true)
class FaceRecognitionParams {
  final List<String> celebritySet;

  FaceRecognitionParams({required this.celebritySet});

  factory FaceRecognitionParams.fromJson(Map<String, dynamic> json) =>
      _$FaceRecognitionParamsFromJson(json);

  Map<String, dynamic> toJson() => _$FaceRecognitionParamsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
