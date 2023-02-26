import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'color_info.dart';

part 'dominant_colors_annotation.g.dart';

/// Set of dominant colors and their corresponding scores.
@JsonSerializable()
class DominantColorsAnnotation {
  /// RGB color values with their score and pixel fraction.
  final List<ColorInfo> colors;

  DominantColorsAnnotation({required this.colors});

  factory DominantColorsAnnotation.fromJson(Map<String, dynamic> json) =>
      _$DominantColorsAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$DominantColorsAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
