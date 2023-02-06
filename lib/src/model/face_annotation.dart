// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'landmark.dart';
import 'bounding_poly.dart';

part 'face_annotation.g.dart';

/// A bucketized representation of likelihood, which is intended to give clients
/// highly stable results across model upgrades.
@JsonEnum()
enum Likelihood {
  @JsonValue('Unknown likelihood')
  UNKNOWN,
  @JsonValue('It is very unlikely')
  VERY_UNLIKELY,
  @JsonValue('It is unlikely')
  UNLIKELY,
  @JsonValue('It is possible')
  POSSIBLE,
  @JsonValue('It is likely')
  LIKELY,
  @JsonValue('It is very likely')
  VERY_LIKELY
}

/// A face annotation object contains the results of face detection.
@JsonSerializable(explicitToJson: true)
class FaceAnnotation {
  /// The bounding polygon around the face. The coordinates of the bounding box
  /// are in the original image's scale. The bounding box is computed to "frame"
  /// the face in accordance with human expectations. It is based on the
  /// landmarker results. Note that one or more x and/or y coordinates may not be
  /// generated in the BoundingPoly (the polygon will be unbounded) if only a
  /// partial face appears in the image to be annotated.
  final BoundingPoly boundingPoly;

  /// The fdBoundingPoly bounding polygon is tighter than the boundingPoly, and
  /// encloses only the skin part of the face. Typically, it is used to eliminate
  /// the face from any image analysis that detects the "amount of skin" visible
  /// in an image. It is not based on the landmarker results, only on the initial
  /// face detection, hence the 'fd' (face detection) prefix.
  final BoundingPoly fdBoundingPoly;

  /// Detected face landmarks.
  final List<Landmark> landmarks;

  /// Roll angle, which indicates the amount of clockwise/anti-clockwise rotation
  /// of the face relative to the image vertical about the axis perpendicular to
  /// the face. Range [-180,180].
  final double rollAngle;

  /// Yaw angle, which indicates the leftward/rightward angle that the face is
  /// pointing relative to the vertical plane perpendicular to the image. Range
  /// [-180,180].
  final double panAngle;

  /// Pitch angle, which indicates the upwards/downwards angle that the face is
  /// pointing relative to the image's horizontal plane. Range [-180,180].
  final double tiltAngle;

  /// Detection confidence. Range [0, 1].
  final double detectionConfidence;

  /// Face landmarking confidence. Range [0, 1].
  final double landmarkingConfidence;

  /// Joy likelihood.
  @JsonKey(name: 'joyLikelihood', unknownEnumValue: Likelihood.UNKNOWN)
  final Likelihood enumJoyLikelihood;

  /// Sorrow likelihood.
  @JsonKey(name: 'sorrowLikelihood', unknownEnumValue: Likelihood.UNKNOWN)
  final Likelihood enumSorrowLikelihood;

  /// Anger likelihood.
  @JsonKey(name: 'angerLikelihood', unknownEnumValue: Likelihood.UNKNOWN)
  final Likelihood enumAngerLikelihood;

  /// Surprise likelihood.
  @JsonKey(name: 'surpriseLikelihood', unknownEnumValue: Likelihood.UNKNOWN)
  final Likelihood enumSurpriseLikelihood;

  /// Under-exposed likelihood.
  @JsonKey(name: 'underExposedLikelihood', unknownEnumValue: Likelihood.UNKNOWN)
  final Likelihood enumUnderExposedLikelihood;

  /// Blurred likelihood.
  @JsonKey(name: 'blurredLikelihood', unknownEnumValue: Likelihood.UNKNOWN)
  final Likelihood enumBlurredLikelihood;

  /// Headwear likelihood.
  @JsonKey(name: 'headwearLikelihood', unknownEnumValue: Likelihood.UNKNOWN)
  final Likelihood enumHeadwearLikelihood;

  FaceAnnotation(
      {required this.boundingPoly,
      required this.fdBoundingPoly,
      required this.landmarks,
      required this.rollAngle,
      required this.panAngle,
      required this.tiltAngle,
      required this.detectionConfidence,
      required this.landmarkingConfidence,
      required this.enumJoyLikelihood,
      required this.enumSorrowLikelihood,
      required this.enumAngerLikelihood,
      required this.enumSurpriseLikelihood,
      required this.enumUnderExposedLikelihood,
      required this.enumBlurredLikelihood,
      required this.enumHeadwearLikelihood});

  factory FaceAnnotation.fromJson(Map<String, dynamic> json) =>
      _$FaceAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$FaceAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
