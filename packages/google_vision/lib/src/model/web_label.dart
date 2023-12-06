import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'web_label.g.dart';

/// Label to provide extra metadata for the web detection.
@JsonSerializable()
class WebLabel {
  /// Label for extra metadata.
  final String label;

  /// The BCP-47 language code for label, such as "en-US" or "sr-Latn". For more
  /// information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
  final String? languageCode;

  WebLabel({
    required this.label,
    this.languageCode,
  });

  factory WebLabel.fromJson(Map<String, dynamic> json) =>
      _$WebLabelFromJson(json);

  Map<String, dynamic> toJson() => _$WebLabelToJson(this);

  @override
  String toString() => json.encode(toJson());
}
