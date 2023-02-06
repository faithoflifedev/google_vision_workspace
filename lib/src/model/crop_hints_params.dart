import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'crop_hints_params.g.dart';

/// Parameters for crop hints annotation request.
@JsonSerializable()
class CropHintsParams {
  /// Aspect ratios in floats, representing the ratio of the width to the height
  /// of the image. For example, if the desired aspect ratio is 4/3, the
  /// corresponding float value should be 1.33333. If not specified, the best
  /// possible crop is returned. The number of provided aspect ratios is limited
  /// to a maximum of 16; any aspect ratios provided after the 16th are ignored.
  final List<double> aspectRatios;

  CropHintsParams({required this.aspectRatios});

  factory CropHintsParams.fromJson(Map<String, dynamic> json) =>
      _$CropHintsParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CropHintsParamsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
