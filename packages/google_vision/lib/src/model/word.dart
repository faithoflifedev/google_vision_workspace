import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';
import 'symbol.dart';
import 'text_property.dart';

part 'word.g.dart';

/// A word representation.
@JsonSerializable(explicitToJson: true)
class Word {
  /// Additional information detected for the word.
  final TextProperty? property;

  /// The bounding box for the word. The vertices are in the order of top-left,
  /// top-right, bottom-right, bottom-left. When a rotation of the bounding box
  /// is detected the rotation is represented as around the top-left corner as
  /// defined when the text is read in the 'natural' orientation. For example:
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

  /// List of symbols in the word. The order of the symbols follows the natural
  /// reading order.
  final List<Symbol>? symbols;

  /// Confidence of the OCR results for the word. Range [0, 1\].
  final double? confidence;

  Word({
    required this.property,
    required this.boundingBox,
    required this.symbols,
    required this.confidence,
  });

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
