import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'face_annotation.dart';
import 'localized_object_annotation.dart';

part 'annotate_image_response.g.dart';

///Individual responses to image annotation requests within the batch.
@JsonSerializable(explicitToJson: true)
class AnnotateImageResponse {
  @JsonKey(name: 'faceAnnotations')
  final List<FaceAnnotation>? faceAnnotationList;

  @JsonKey(name: 'localizedObjectAnnotations')
  final List<LocalizedObjectAnnotation>? localizedObjectAnnotationList;

  ///If present, face detection has completed successfully.
  List<FaceAnnotation> get faceAnnotations =>
      faceAnnotationList ?? <FaceAnnotation>[];

  ///If present, landmark detection has completed successfully.
  List<LocalizedObjectAnnotation> get localizedObjectAnnotations =>
      localizedObjectAnnotationList ?? <LocalizedObjectAnnotation>[];

  AnnotateImageResponse(
      {this.faceAnnotationList, this.localizedObjectAnnotationList});

  factory AnnotateImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnotateImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotateImageResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
