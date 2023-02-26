import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'color.dart';

part 'color_info.g.dart';

/// Color information consists of RGB channels, score, and the fraction of the
/// image that the color occupies in the image.
@JsonSerializable()
class ColorInfo {
  /// RGB components of the color.
  final Color color;

  /// Image-specific score for this color. Value in range [0, 1].
  final double score;

  /// The fraction of pixels the color occupies in the image. Value in range
  /// [0, 1].
  final double pixelFraction;

  ColorInfo({
    required this.color,
    required this.score,
    required this.pixelFraction,
  });

  factory ColorInfo.fromJson(Map<String, dynamic> json) =>
      _$ColorInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ColorInfoToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
