import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'object_annotation.g.dart';

/// Prediction for what the object in the bounding box is.
@JsonSerializable()
class ObjectAnnotation {
  /// Object ID that should align with EntityAnnotation mid.
  final String mid;

  /// The BCP-47 language code, such as "en-US" or "sr-Latn". For more
  /// information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
  final String languageCode;

  /// Object name, expressed in its languageCode language.
  final String name;

  /// Score of the result. Range [0, 1\].
  final double score;

  ObjectAnnotation({
    required this.mid,
    required this.languageCode,
    required this.name,
    required this.score,
  });

  factory ObjectAnnotation.fromJson(Map<String, dynamic> json) =>
      _$ObjectAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectAnnotationToJson(this);

  @override
  String toString() => json.encode(toJson());
}
