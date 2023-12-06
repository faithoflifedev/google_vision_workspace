import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'web_entity.g.dart';

/// Entity deduced from similar images on the Internet.
@JsonSerializable()
class WebEntity {
  /// Opaque entity ID.
  final String entityId;

  /// Overall relevancy score for the entity. Not normalized and not comparable
  /// across different image queries.
  final num score;

  /// Canonical description of the entity, in English.
  final String description;

  WebEntity({
    required this.entityId,
    required this.score,
    required this.description,
  });

  factory WebEntity.fromJson(Map<String, dynamic> json) =>
      _$WebEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WebEntityToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
