// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'feature.g.dart';

/// The type of Google Cloud Vision API detection to perform, and the maximum
/// number of results to return for that type. Multiple Feature objects can be
/// specified in the features list.
@JsonSerializable()
class Feature {
  /// Maximum number of results of this type. Does not apply to TEXT_DETECTION,
  /// DOCUMENT_TEXT_DETECTION, or CROP_HINTS.
  final int? maxResults;

  /// The feature type.
  final AnnotationType type;

  Feature({this.maxResults, required this.type});

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}

@JsonEnum(valueField: 'type')
enum AnnotationType {
  /// unspecified
  typeUnspecified('TYPE_UNSPECIFIED'),

  /// Face detection
  faceDetection('FACE_DETECTION'),

  /// Landmark detection
  landmarkDetection('LANDMARK_DETECTION'),

  /// Logo detection
  logoDetection('LOGO_DETECTION'),

  /// Label detection
  labelDetection('LABEL_DETECTION'),

  ///Object Localization
  objectLocalization('OBJECT_LOCALIZATION'),

  /// Text detection / Optical Character Recognition (OCR)
  textDetection('TEXT_DETECTION'),

  /// Document Text detection / Optical Character Recognition (OCR)
  documentTextDetection('DOCUMENT_TEXT_DETECTION'),

  /// Safe Search detection
  safeSearchDetection('SAFE_SEARCH_DETECTION'),

  /// Image properties
  imageProperties('IMAGE_PROPERTIES'),

  /// Crop hints
  cropHints('CROP_HINTS'),

  /// Web detection
  webDetection('WEB_DETECTION'),

  /// Product search
  productSearch('PRODUCT_SEARCH');

  const AnnotationType(this.type);

  final String type;
}
