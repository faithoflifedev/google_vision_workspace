// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'detected_break.g.dart';

/// Enum to denote the type of break found. New line, space etc.
enum BreakType { UNKNOWN, SPACE, EOL_SURE_SPACE, HYPHEN, LINE_BREAK }

/// Detected start or end of a structural component.
@JsonSerializable(explicitToJson: true)
class DetectedBreak {
  /// Detected break type.
  @JsonKey(unknownEnumValue: BreakType.UNKNOWN)
  BreakType type;

  /// True if break prepends the element.
  final bool? isPrefix;

  DetectedBreak({this.type = BreakType.UNKNOWN, required this.isPrefix});

  factory DetectedBreak.fromJson(Map<String, dynamic> json) =>
      _$DetectedBreakFromJson(json);

  Map<String, dynamic> toJson() => _$DetectedBreakToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
