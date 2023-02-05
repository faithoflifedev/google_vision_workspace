import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'label_annotation.g.dart';

/// Set of detected labels
@JsonSerializable(explicitToJson: true)
class LabelAnnotation {
  /// If present, contains a machine-generated identifier (MID) corresponding to the entity's [Google Knowledge Graph entry](https://developers.google.com/knowledge-graph/reference/rest/v1/). Note that mid values remain unique across different languages, so you can use these values to tie entities together from different languages. To inspect MID values, refer to the Google Knowledge Graph API documentation.
  final String? mid;

  /// The label itself
  final String description;

  /// Score of the result. Range [0, 1].
  final double score;

  /// Topicality of the result. Range [0, 1].
  final double topicality;

  LabelAnnotation(
      {required this.mid,
      required this.description,
      required this.score,
      required this.topicality});

  factory LabelAnnotation.fromJson(Map<String, dynamic> json) =>
      _$LabelAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$LabelAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
