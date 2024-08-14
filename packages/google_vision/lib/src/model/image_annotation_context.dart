import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'image_annotation_context.g.dart';

/// If an image was produced from a file (e.g. a PDF), this message gives
/// information about the source of that image.
@JsonSerializable()
class ImageAnnotationContext {
  /// The URI of the file used to produce the image.
  final String? uri;

  /// If the file was a PDF or TIFF, this field gives the page number within the
  /// file used to produce the image.
  final int pageNumber;

  ImageAnnotationContext({
    this.uri,
    required this.pageNumber,
  });

  factory ImageAnnotationContext.fromJson(Map<String, dynamic> json) =>
      _$ImageAnnotationContextFromJson(json);

  Map<String, dynamic> toJson() => _$ImageAnnotationContextToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
