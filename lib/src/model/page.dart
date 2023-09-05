import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'block.dart';
import 'text_property.dart';

part 'page.g.dart';

/// Detected page from OCR.
@JsonSerializable(explicitToJson: true)
class Page {
  /// Additional information detected on the page.
  final TextProperty? property;

  /// Page width. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
  final int width;

  /// Page height. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
  final int height;

<<<<<<< HEAD
  /// List of blocks of text, images etc on this page.
  final List<Block>? blocks;

  /// Confidence of the OCR results on the page. Range [0, 1\].
=======
  /// Confidence of the OCR results on the page. Range \[0, 1\].
>>>>>>> 41a3014 ('added support for more detection methods')
  final double? confidence;

  Page({
    required this.property,
    required this.width,
    required this.height,
    required this.blocks,
    required this.confidence,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
