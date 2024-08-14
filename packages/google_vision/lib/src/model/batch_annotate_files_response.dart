import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'annotate_file_response.dart';

part 'batch_annotate_files_response.g.dart';

/// Response to a batch image annotation request.
@JsonSerializable()
class BatchAnnotateFilesResponse {
  /// The list of file annotation responses, each response corresponding to each
  /// AnnotateFileRequest in BatchAnnotateFilesRequest.
  final List<AnnotateFileResponse> responses;

  BatchAnnotateFilesResponse({
    required this.responses,
  });

  factory BatchAnnotateFilesResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchAnnotateFilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BatchAnnotateFilesResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
