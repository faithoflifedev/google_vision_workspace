import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';

part 'crop_hint.g.dart';

/// Single crop hint that is used to generate a new crop when serving an image.
@JsonSerializable()
class CropHint {
  /// The bounding polygon for the crop region. The coordinates of the bounding
  /// box are in the original image's scale.
  final BoundingPoly boundingPoly;

  /// Confidence of this being a salient region. Range [0, 1].
  final double confidence;

  /// Fraction of importance of this salient region with respect to the original
  /// image.
  final double importanceFraction;

  CropHint({
    required this.boundingPoly,
    required this.confidence,
    required this.importanceFraction,
  });

  factory CropHint.fromJson(Map<String, dynamic> json) =>
      _$CropHintFromJson(json);

  Map<String, dynamic> toJson() => _$CropHintToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
