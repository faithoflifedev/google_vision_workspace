// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'feature.g.dart';

///The type of Google Cloud Vision API detection to perform, and the maximum
///number of results to return for that type. Multiple Feature objects can be
///specified in the features list.
@JsonSerializable()
class Feature {
  ///Maximum number of results of this type. Does not apply to TEXT_DETECTION,
  ///DOCUMENT_TEXT_DETECTION, or CROP_HINTS.
  final int maxResults;

  ///The feature type.
  final String type;

  Feature({required this.maxResults, required this.type});

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}

enum DetectionType {
  TEXT_DETECTION,
  DOCUMENT_TEXT_DETECTION,
  CROP_HINTS,
  FACE_DETECTION,
  IMAGE_PROPERTIES,
  LABEL_DETECTION,
  LANDMARK_DETECTION,
  LOGO_DETECTION,
  OBJECT_LOCALIZATION,
  SAFE_SEARCH_DETECTION,
  WEB_DETECTION
}
