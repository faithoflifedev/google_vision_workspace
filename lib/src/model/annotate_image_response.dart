import 'dart:convert';

import 'package:google_vision/src/model/safe_search_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'face_annotation.dart';
import 'localized_object_annotation.dart';
import 'label_annotation.dart';

part 'annotate_image_response.g.dart';

///Individual responses to image annotation requests within the batch.
@JsonSerializable(explicitToJson: true)
class AnnotateImageResponse {
  @JsonKey(name: 'faceAnnotations')
  final List<FaceAnnotation>? faceAnnotationList;

  @JsonKey(name: 'localizedObjectAnnotations')
  final List<LocalizedObjectAnnotation>? localizedObjectAnnotationList;

  @JsonKey(name: 'labelAnnotations')
  final List<LabelAnnotation>? labelAnnotationList;

  final SafeSearchAnnotation? safeSearchAnnotation;

  ///If present, face detection has completed successfully.
  List<FaceAnnotation> get faceAnnotations =>
      faceAnnotationList ?? <FaceAnnotation>[];

  ///If present, landmark detection has completed successfully.
  List<LocalizedObjectAnnotation> get localizedObjectAnnotations =>
      localizedObjectAnnotationList ?? <LocalizedObjectAnnotation>[];

  ///If present, label  detection has completed successfully.
  List<LabelAnnotation> get labelAnnotations =>
      labelAnnotationList ?? <LabelAnnotation>[];

  AnnotateImageResponse(
      {this.faceAnnotationList,
      this.localizedObjectAnnotationList,
      this.labelAnnotationList,
      this.safeSearchAnnotation});

  factory AnnotateImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnotateImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotateImageResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
