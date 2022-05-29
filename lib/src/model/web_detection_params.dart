import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'web_detection_params.g.dart';

///Parameters for web detection.
@JsonSerializable()
class WebDetectionParams {
  ///Whether to include results derived from the geo information in the image.
  final bool includeGeoResults;

  WebDetectionParams({required this.includeGeoResults});

  factory WebDetectionParams.fromJson(Map<String, dynamic> json) =>
      _$WebDetectionParamsFromJson(json);

  Map<String, dynamic> toJson() => _$WebDetectionParamsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
