// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'safe_search_annotation.g.dart';

/// A bucketized representation of likelihood, which is intended to give clients
/// highly stable results across model upgrades.
enum SafeSearchDetectionType {
  VERY_LIKELY,
  LIKELY,
  UNLIKELY,
  VERY_UNLIKELY,
  POSSIBLE,
  UNKNOWN,
}

/// Set of features pertaining to the image, computed by computer vision methods
/// over safe-search verticals (for example, adult, spoof, medical, violence).
@JsonSerializable(explicitToJson: true)
class SafeSearchAnnotation {
  /// Represents the adult content likelihood for the image. Adult content may
  /// contain elements such as nudity, pornographic images or cartoons, or
  /// sexual activities.
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType adult;

  /// Spoof likelihood. The likelihood that a modification was made to the
  /// image's canonical version to make it appear funny or offensive.
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType spoof;

  /// Likelihood that this is a medical image.
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType medical;

  /// Likelihood that this image contains violent content.
  @JsonKey(unknownEnumValue: SafeSearchDetectionType.UNKNOWN)
  SafeSearchDetectionType violence;

  /// Likelihood that the request image contains racy content. Racy content may
  /// include (but is not limited to) skimpy or sheer clothing, strategically
  /// covered nudity, lewd or provocative poses, or close-ups of sensitive body
  /// areas.
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
