// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'bounding_poly.dart';
import 'paragraph.dart';
import 'text_property.dart';

part 'block.g.dart';

/// Logical element on the page.
@JsonSerializable(explicitToJson: true)
class Block {
  /// Additional information detected for the block.
  final TextProperty? property;

  /// The bounding box for the block. The vertices are in the order of top-left,
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

  /// List of paragraphs in this block (if this blocks is of type text).
  final List<Paragraph>? paragraphs;

  /// Detected block type (text, image etc) for this block.
  @JsonKey(unknownEnumValue: BlockType.UNKNOWN)
  final BlockType blockType;

  /// Confidence of the OCR results on the block. Range [0, 1\].
  final double? confidence;

  Block({
    required this.property,
    required this.boundingBox,
    this.blockType = BlockType.UNKNOWN,
    required this.paragraphs,
    required this.confidence,
  });

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

  Map<String, dynamic> toJson() => _$BlockToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}

/// Type of a block (text, image etc) as identified by OCR.
@JsonEnum()
enum BlockType {
  UNKNOWN,
  TEXT,
  TABLE,
  PICTURE,
  RULER,
  BARCODE,
}
