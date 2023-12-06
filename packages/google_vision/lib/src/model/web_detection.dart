import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'web_entity.dart';
import 'web_image.dart';
import 'web_label.dart';
import 'web_page.dart';

part 'web_detection.g.dart';

/// Relevant information for the image from the Internet.
@JsonSerializable()
class WebDetection {
  /// Entity deduced from similar images on the Internet.
  final List<WebEntity>? webEntities;

  /// Fully matching images from the Internet.
  final List<WebImage>? fullMatchingImages;

  /// Partial matching images from the Internet.
  final List<WebImage>? partialMatchingImages;

  final List<WebPage>? pagesWithMatchingImages;

  final List<WebImage>? visuallySimilarImages;

  final List<WebLabel>? bestGuessLabels;

  WebDetection({
    this.webEntities,
    this.fullMatchingImages,
    this.partialMatchingImages,
    this.pagesWithMatchingImages,
    this.visuallySimilarImages,
    this.bestGuessLabels,
  });

  factory WebDetection.fromJson(Map<String, dynamic> json) =>
      _$WebDetectionFromJson(json);

  Map<String, dynamic> toJson() => _$WebDetectionToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
