import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'feature.dart';
import 'input_config.dart';
import 'image_context.dart';

part 'annotate_file_request.g.dart';

/// A request to annotate one single file, e.g. a PDF, TIFF or GIF file.
@JsonSerializable()
class AnnotateFileRequest {
  /// Required. Information about the input file.
  final InputConfig inputConfig;

  /// Required. Requested features.
  final List<Feature> features;

  /// Additional context that may accompany the image(s) in the file.
  final ImageContext? imageContext;

  /// Pages of the file to perform image annotation.
  ///
  /// Pages starts from 1, we assume the first page of the file is page 1. At
  /// most 5 pages are supported per request. Pages can be negative.
  ///
  /// Page 1 means the first page. Page 2 means the second page. Page -1 means
  /// the last page. Page -2 means the second to the last page.
  ///
  /// If the file is GIF instead of PDF or TIFF, page refers to GIF frames.
  ///
  /// If this field is empty, by default the service performs image annotation
  /// for the first 5 pages of the file.
  final List<int>? pages;

  AnnotateFileRequest({
    required this.inputConfig,
    required this.features,
    this.imageContext,
    this.pages,
  });

  factory AnnotateFileRequest.fromJson(Map<String, dynamic> json) =>
      _$AnnotateFileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotateFileRequestToJson(this);

  @override
  String toString() => json.encode(toJson());
}
