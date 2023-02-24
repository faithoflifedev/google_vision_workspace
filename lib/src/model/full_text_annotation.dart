import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'page.dart';

part 'full_text_annotation.g.dart';

/// TextAnnotation contains a structured representation of OCR extracted text.
/// The hierarchy of an OCR extracted text structure is like this:
/// TextAnnotation -> Page -> Block -> Paragraph ->
/// Word -> Symbol Each structural component,
@JsonSerializable(explicitToJson: true)
class FullTextAnnotation {
  /// The language code for the locale in which the entity textual description is expressed.
  final List<Page> pages;

  /// Entity textual description, expressed in its locale language.
  final String text;

  FullTextAnnotation({
    required this.pages,
    required this.text,
  });

  factory FullTextAnnotation.fromJson(Map<String, dynamic> json) =>
      _$FullTextAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$FullTextAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
