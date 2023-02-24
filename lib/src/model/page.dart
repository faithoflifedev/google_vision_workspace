import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'text_property.dart';

part 'page.g.dart';

/// Additional information detected on the structural component.
@JsonSerializable(explicitToJson: true)
class Page {
  /// Additional information detected on the page.
  final TextProperty? property;

  /// Page width. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
  final int width;

  /// Page height. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
  final int height;

  /// Confidence of the OCR results on the page. Range [0, 1].
  final double? confidence;

  Page({
    required this.property,
    required this.width,
    required this.height,
    required this.confidence,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
