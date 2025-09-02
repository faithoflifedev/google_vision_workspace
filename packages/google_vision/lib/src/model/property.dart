import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'property.g.dart';

/// A Property consists of a user-supplied name/value pair.
@JsonSerializable()
class Property {
  /// Name of the property.
  final String name;

  /// Value of the property.
  final String? value;

  /// Value of numeric properties.
  final num? number;

  Property({required this.name, this.value, this.number});

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
