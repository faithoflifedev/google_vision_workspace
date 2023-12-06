import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';
import 'text_property.dart';

part 'symbol.g.dart';

/// A single symbol representation.
@JsonSerializable(explicitToJson: true)
class Symbol {
  /// Additional information detected for the symbol.
  final TextProperty? property;

  /// The bounding box for the symbol. The vertices are in the order of
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

  /// The actual UTF-8 representation of the symbol.
  final String? text;

  /// Confidence of the OCR results for the symbol. Range [0, 1\].
  final double? confidence;

  Symbol({
    required this.property,
    required this.boundingBox,
    required this.text,
    required this.confidence,
  });

  factory Symbol.fromJson(Map<String, dynamic> json) => _$SymbolFromJson(json);

  Map<String, dynamic> toJson() => _$SymbolToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
