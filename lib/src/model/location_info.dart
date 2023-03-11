import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'lat_lng.dart';

part 'location_info.g.dart';

/// Detected entity location information.
@JsonSerializable(explicitToJson: true)
class LocationInfo {
  /// Additional information detected on the LocationInfo.
  final LatLng latLng;

  LocationInfo({required this.latLng});

  factory LocationInfo.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationInfoToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
