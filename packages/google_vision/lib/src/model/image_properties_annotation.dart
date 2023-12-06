import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'dominant_colors_annotation.dart';

part 'image_properties_annotation.g.dart';

/// Stores image properties, such as dominant colors.
@JsonSerializable()
class ImagePropertiesAnnotation {
  /// If present, dominant colors completed successfully.
  final DominantColorsAnnotation dominantColors;

  ImagePropertiesAnnotation({required this.dominantColors});

  factory ImagePropertiesAnnotation.fromJson(Map<String, dynamic> json) =>
      _$ImagePropertiesAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$ImagePropertiesAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
