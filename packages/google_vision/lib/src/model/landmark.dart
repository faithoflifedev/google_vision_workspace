// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'position.dart';

part 'landmark.g.dart';

/// Face landmark (feature) type. Left and right are defined from the vantage of
/// the viewer of the image without considering mirror projections typical of
/// photos. So, LEFT_EYE, typically, is the person's right eye.
@JsonEnum()
enum LandmarkType {
  @JsonValue('Unknown')
  UNKNOWN_LANDMARK,
  @JsonValue('LEFT_EYE')
  LEFT_EYE,
  @JsonValue('RIGHT_EYE')
  RIGHT_EYE,
  @JsonValue('LEFT_OF_LEFT_EYEBROW')
  LEFT_OF_LEFT_EYEBROW,
  @JsonValue('RIGHT_OF_LEFT_EYEBROW')
  RIGHT_OF_LEFT_EYEBROW,
  @JsonValue('LEFT_OF_RIGHT_EYEBROW')
  LEFT_OF_RIGHT_EYEBROW,
  @JsonValue('RIGHT_OF_RIGHT_EYEBROW')
  RIGHT_OF_RIGHT_EYEBROW,
  @JsonValue('MIDPOINT_BETWEEN_EYES')
  MIDPOINT_BETWEEN_EYES,
  @JsonValue('NOSE_TIP')
  NOSE_TIP,
  @JsonValue('UPPER_LIP')
  UPPER_LIP,
  @JsonValue('LOWER_LIP')
  LOWER_LIP,
  @JsonValue('MOUTH_LEFT')
  MOUTH_LEFT,
  @JsonValue('MOUTH_RIGHT')
  MOUTH_RIGHT,
  @JsonValue('MOUTH_CENTER')
  MOUTH_CENTER,
  @JsonValue('NOSE_BOTTOM_RIGHT')
  NOSE_BOTTOM_RIGHT,
  @JsonValue('NOSE_BOTTOM_LEFT')
  NOSE_BOTTOM_LEFT,
  @JsonValue('NOSE_BOTTOM_CENTER')
  NOSE_BOTTOM_CENTER,
  @JsonValue('LEFT_EYE_TOP_BOUNDARY')
  LEFT_EYE_TOP_BOUNDARY,
  @JsonValue('LEFT_EYE_RIGHT_CORNER')
  LEFT_EYE_RIGHT_CORNER,
  @JsonValue('LEFT_EYE_BOTTOM_BOUNDARY')
  LEFT_EYE_BOTTOM_BOUNDARY,
  @JsonValue('LEFT_EYE_LEFT_CORNER')
  LEFT_EYE_LEFT_CORNER,
  @JsonValue('RIGHT_EYE_TOP_BOUNDARY')
  RIGHT_EYE_TOP_BOUNDARY,
  @JsonValue('RIGHT_EYE_RIGHT_CORNER')
  RIGHT_EYE_RIGHT_CORNER,
  @JsonValue('RIGHT_EYE_BOTTOM_BOUNDARY')
  RIGHT_EYE_BOTTOM_BOUNDARY,
  @JsonValue('RIGHT_EYE_LEFT_CORNER')
  RIGHT_EYE_LEFT_CORNER,
  @JsonValue('LEFT_EYEBROW_UPPER_MIDPOINT')
  LEFT_EYEBROW_UPPER_MIDPOINT,
  @JsonValue('RIGHT_EYEBROW_UPPER_MIDPOINT')
  RIGHT_EYEBROW_UPPER_MIDPOINT,
  @JsonValue('LEFT_EAR_TRAGION')
  LEFT_EAR_TRAGION,
  @JsonValue('RIGHT_EAR_TRAGION')
  RIGHT_EAR_TRAGION,
  @JsonValue('LEFT_EYE_PUPIL')
  LEFT_EYE_PUPIL,
  @JsonValue('RIGHT_EYE_PUPIL')
  RIGHT_EYE_PUPIL,
  @JsonValue('FOREHEAD_GLABELLA')
  FOREHEAD_GLABELLA,
  @JsonValue('CHIN_GNATHION')
  CHIN_GNATHION,
  @JsonValue('CHIN_LEFT_GONION')
  CHIN_LEFT_GONION,
  @JsonValue('CHIN_RIGHT_GONION')
  CHIN_RIGHT_GONION,
  @JsonValue('LEFT_CHEEK_CENTER')
  LEFT_CHEEK_CENTER,
  @JsonValue('RIGHT_CHEEK_CENTER')
  RIGHT_CHEEK_CENTER,
}

/// Face landmark (feature) type. Left and right are defined from the vantage of
/// the viewer of the image without considering mirror projections typical of
/// photos. So, LEFT_EYE, typically, is the person's right eye.
@JsonSerializable(explicitToJson: true)
class Landmark {
  /// Face landmark (feature) type. Left and right are defined from the vantage
  /// of the viewer of the image without considering mirror projections typical
  /// of photos. So, LEFT_EYE, typically, is the person's right eye.
  @JsonKey(unknownEnumValue: LandmarkType.UNKNOWN_LANDMARK)
  final LandmarkType type;

  /// A 3D position in the image, used primarily for Face detection landmarks. A
  /// valid Position must have both x and y coordinates. The position
  /// coordinates are in the same scale as the original image.
  final Position position;

  Landmark({required this.type, required this.position});

  factory Landmark.fromJson(Map<String, dynamic> json) =>
      _$LandmarkFromJson(json);

  Map<String, dynamic> toJson() => _$LandmarkToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
