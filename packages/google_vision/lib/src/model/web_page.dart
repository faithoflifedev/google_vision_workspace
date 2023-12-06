import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'web_image.dart';

part 'web_page.g.dart';

/// Metadata for web pages.
@JsonSerializable()
class WebPage {
  /// The result web page URL.
  final String url;

  /// (Deprecated) Overall relevancy score for the image.
  final num? score;

  /// Title for the web page, may contain HTML markups.
  final String pageTitle;

  /// Fully matching images on the page. Can include resized copies of the query
  /// image.
  List<WebImage>? fullMatchingImages;

  /// Partial matching images on the page. Those images are similar enough to
  /// share some key-point features. For example an original image will likely
  /// have partial matching for its crops.
  List<WebImage>? partialMatchingImages;

  WebPage({
    required this.url,
    required this.score,
    required this.pageTitle,
    this.fullMatchingImages,
    this.partialMatchingImages,
  });

  factory WebPage.fromJson(Map<String, dynamic> json) =>
      _$WebPageFromJson(json);

  Map<String, dynamic> toJson() => _$WebPageToJson(this);

  @override
  String toString() => json.encode(toJson());
}
