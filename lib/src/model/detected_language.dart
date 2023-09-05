import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'detected_language.g.dart';

/// Detected language for a structural component.
@JsonSerializable(explicitToJson: true)
class DetectedLanguage {
  /// The BCP-47 language code, such as "en-US" or "sr-Latn".
  final String languageCode;

<<<<<<< HEAD
  /// Confidence of detected language. Range [0, 1\].
=======
  /// Confidence of detected language. Range \[0, 1\].
>>>>>>> 41a3014 ('added support for more detection methods')
  final double? confidence;

  DetectedLanguage({required this.languageCode, required this.confidence});

  factory DetectedLanguage.fromJson(Map<String, dynamic> json) =>
      _$DetectedLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$DetectedLanguageToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
