// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'safe_search_annotation.g.dart';

enum SafeSearchDectionType {
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
  @JsonKey(unknownEnumValue: SafeSearchDectionType.UNKNOWN)
  SafeSearchDectionType adult;
  @JsonKey(unknownEnumValue: SafeSearchDectionType.UNKNOWN)
  SafeSearchDectionType spoof;
  @JsonKey(unknownEnumValue: SafeSearchDectionType.UNKNOWN)
  SafeSearchDectionType medical;
  @JsonKey(unknownEnumValue: SafeSearchDectionType.UNKNOWN)
  SafeSearchDectionType violence;
  @JsonKey(unknownEnumValue: SafeSearchDectionType.UNKNOWN)
  SafeSearchDectionType rancy;

  SafeSearchAnnotation(
      {this.adult = SafeSearchDectionType.UNKNOWN,
      this.medical = SafeSearchDectionType.UNKNOWN,
      this.rancy = SafeSearchDectionType.UNKNOWN,
      this.spoof = SafeSearchDectionType.UNKNOWN,
      this.violence = SafeSearchDectionType.UNKNOWN});

  factory SafeSearchAnnotation.fromJson(Map<String, dynamic> json) =>
      _$SafeSearchAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$SafeSearchAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
