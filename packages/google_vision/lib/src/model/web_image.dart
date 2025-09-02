import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'web_image.g.dart';

/// Metadata for online images.
@JsonSerializable()
class WebImage {
  /// The result image URL.
  final String url;

  /// (Deprecated) Overall relevancy score for the image.
  final num? score;

  WebImage({required this.url, required this.score});

  factory WebImage.fromJson(Map<String, dynamic> json) =>
      _$WebImageFromJson(json);

  Map<String, dynamic> toJson() => _$WebImageToJson(this);

  @override
  String toString() => json.encode(toJson());
}
