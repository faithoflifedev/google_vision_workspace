import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';
import 'text_property.dart';
import 'word.dart';

part 'paragraph.g.dart';

/// Structural unit of text representing a number of words in certain order.
@JsonSerializable(explicitToJson: true)
class Paragraph {
  /// Additional information detected for the paragraph.
  final TextProperty? property;

  /// The bounding box for the paragraph. The vertices are in the order of
  /// top-left, top-right, bottom-right, bottom-left. When a rotation of the
  /// bounding box is detected the rotation is represented as around the
  /// top-left corner as defined when the text is read in the 'natural'
  /// orientation. For example:
  ///
  /// - when the text is horizontal it might look like:
  ///
  /// ```
  ///     0----1
  ///     |    |
  ///     3----2
  /// ```
  ///
  /// - when it's rotated 180 degrees around the top-left corner it becomes:
  ///
  /// ```
  ///     2----3
  ///     |    |
  ///     1----0
  /// ```
  ///
  /// and the vertex order will still be (0, 1, 2, 3).
  final BoundingPoly? boundingBox;

  /// List of all words in this paragraph.
  final List<Word>? words;

  /// Confidence of the OCR results for the paragraph. Range [0, 1\].
  final double? confidence;

  Paragraph({
    required this.property,
    required this.boundingBox,
    required this.words,
    required this.confidence,
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) =>
      _$ParagraphFromJson(json);

  Map<String, dynamic> toJson() => _$ParagraphToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
