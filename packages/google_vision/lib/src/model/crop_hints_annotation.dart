import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'crop_hint.dart';

part 'crop_hints_annotation.g.dart';

/// Set of crop hints that are used to generate new crops when serving images.
@JsonSerializable()
class CropHintsAnnotation {
  /// The BCP-47 language code, such as "en-US" or "sr-Latn".
  final List<CropHint> cropHints;

  CropHintsAnnotation({required this.cropHints});

  factory CropHintsAnnotation.fromJson(Map<String, dynamic> json) =>
      _$CropHintsAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$CropHintsAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
