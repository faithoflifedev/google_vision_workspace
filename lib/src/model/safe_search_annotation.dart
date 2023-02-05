// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'safe_search_annotation.g.dart';

enum SafeSearchDetectionType {
  VERY_LIKELY,
  LIKELY,
  UNLIKELY,
  VERY_UNLIKELY,
  POSSIBLE,
  UNKNOWN,
}

///Parameters for product search.
@JsonSerializable(explicitToJson: true)
class SafeSearchAnnotation {
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType adult;
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType spoof;
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType medical;
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType violence;
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType racy;

  SafeSearchAnnotation({
    this.adult = SafeSearchDetectionType.UNKNOWN,
    this.medical = SafeSearchDetectionType.UNKNOWN,
    this.racy = SafeSearchDetectionType.UNKNOWN,
    this.spoof = SafeSearchDetectionType.UNKNOWN,
    this.violence = SafeSearchDetectionType.UNKNOWN,
  });

  factory SafeSearchAnnotation.fromJson(Map<String, dynamic> json) =>
      _$SafeSearchAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$SafeSearchAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
