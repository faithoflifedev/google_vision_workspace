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
  @JsonValue('Left eye')
  LEFT_EYE,
  @JsonValue('Right eye')
  RIGHT_EYE,
  @JsonValue('Left of left eyebrow')
  LEFT_OF_LEFT_EYEBROW,
  @JsonValue('Right of left eyebrow')
  RIGHT_OF_LEFT_EYEBROW,
  @JsonValue('Left of right eyebrow')
  LEFT_OF_RIGHT_EYEBROW,
  @JsonValue('Right of right eyebrow')
  RIGHT_OF_RIGHT_EYEBROW,
  @JsonValue('Midpoint between eyes')
  MIDPOINT_BETWEEN_EYES,
  @JsonValue('Nose tip')
  NOSE_TIP,
  @JsonValue('Upper lip')
  UPPER_LIP,
  @JsonValue('Lower lip')
  LOWER_LIP,
  @JsonValue('Mouth left')
  MOUTH_LEFT,
  @JsonValue('Mouth right')
  MOUTH_RIGHT,
  @JsonValue('Mouth center')
  MOUTH_CENTER,
  @JsonValue('Nose, bottom right')
  NOSE_BOTTOM_RIGHT,
  @JsonValue('Nose, bottom left')
  NOSE_BOTTOM_LEFT,
  @JsonValue('Nose, bottom center')
  NOSE_BOTTOM_CENTER,
  @JsonValue('Left eye, top boundary')
  LEFT_EYE_TOP_BOUNDARY,
  @JsonValue('Left eye, right corner')
  LEFT_EYE_RIGHT_CORNER,
  @JsonValue('Left eye, bottom bound')
  LEFT_EYE_BOTTOM_BOUNDARY,
  @JsonValue('Left eye, left corner')
  LEFT_EYE_LEFT_CORNER,
  @JsonValue('Right eye, top boundary')
  RIGHT_EYE_TOP_BOUNDARY,
  @JsonValue('Right eye, right corner')
  RIGHT_EYE_RIGHT_CORNER,
  @JsonValue('Right eye, bottom boundary')
  RIGHT_EYE_BOTTOM_BOUNDARY,
  @JsonValue('Right eye, left corner')
  RIGHT_EYE_LEFT_CORNER,
  @JsonValue('Left eyebrow, upper midpoint')
  LEFT_EYEBROW_UPPER_MIDPOINT,
  @JsonValue('Right eyebrow, upper midpoint')
  RIGHT_EYEBROW_UPPER_MIDPOINT,
  @JsonValue('Left ear tragion')
  LEFT_EAR_TRAGION,
  @JsonValue('Right ear tragion')
  RIGHT_EAR_TRAGION,
  @JsonValue('Left eye pupil')
  LEFT_EYE_PUPIL,
  @JsonValue('Right eye pupil')
  RIGHT_EYE_PUPIL,
  @JsonValue('Forehead glabella')
  FOREHEAD_GLABELLA,
  @JsonValue('Chin gnathion')
  CHIN_GNATHION,
  @JsonValue('Chin left gonion')
  CHIN_LEFT_GONION,
  @JsonValue('Chin right gonion')
  CHIN_RIGHT_GONION,
  @JsonValue('Left cheek center')
  LEFT_CHEEK_CENTER,
  @JsonValue('Right cheek center')
  RIGHT_CHEEK_CENTER
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
