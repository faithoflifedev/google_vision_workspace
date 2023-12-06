import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'detected_break.dart';
import 'detected_language.dart';

part 'text_property.g.dart';

/// Additional information detected on the structural component.
@JsonSerializable(explicitToJson: true)
class TextProperty {
  /// A list of detected languages together with confidence.
  final List<DetectedLanguage>? detectedLanguages;

  /// Detected start or end of a text segment.
  final DetectedBreak? detectedBreak;

  TextProperty({
    required this.detectedLanguages,
    required this.detectedBreak,
  });

  factory TextProperty.fromJson(Map<String, dynamic> json) =>
      _$TextPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$TextPropertyToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
